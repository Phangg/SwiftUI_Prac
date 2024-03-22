//
//  AddItemFeature.swift
//  MemoTCA1.9
//
//  Created by phang on 3/21/24.
//

import SwiftUI
import PhotosUI
import SwiftData

import ComposableArchitecture

// MARK: - Add Item Feature
@Reducer
struct AddItemFeature {
    
    @ObservableState
    struct State: Equatable {
        @Presents var alert: AlertState<Action.Alert>?
        var item: Item
        var selectedPhotos: [PhotosPickerItem]
        var images: [UIImage]
        var isLoading: Bool
    }
    
    enum Action {
        case alert(PresentationAction<Alert>)
        case delegate(Delegate)
        case saveButtonTapped
        case setContent(String)
        case setImagesData([Data])
        case setUIImages([UIImage])
        case setPhotos([PhotosPickerItem])
        case toggleLoadingState
        case refresh
        case removeImage(Int)
        case removePhoto(Int)
        case removeAllPhotos
        enum Delegate {
            case saveItem(Item)
        }
        enum Alert {
            case isNotEmptyContent
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.imageService) var imageService

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            // 저장 할때, contents 가 있어야 가능
            case .alert(.presented(.isNotEmptyContent)):
                return .none
            //
            case .alert:
                return .none
            // delegate
            case .delegate:
                return .none
            // 저장 버튼 탭
            case .saveButtonTapped:
                if state.item.content.isEmpty {
                    state.alert = .isContentConfirm
                    return .none
                } else {
                    return .run { [item = state.item] send in
                        await send(.delegate(.saveItem(item)))
                        await self.dismiss()
                    }
                }
            // 내용 추가
            case let .setContent(content):
                state.item.content = content
                return .none
            // 변환된 이미지 데이터를 배열에 저장
            case let .setImagesData(imagesData):
                state.item.imagesData = imagesData
                return .none
            // 변환된 이미지를 배열에 저장
            case let .setUIImages(images):
                state.images = images
                return .none
            // 이미지 추가
            case let .setPhotos(photos):
                state.selectedPhotos = photos
                return .run { @MainActor send in
                    send(.toggleLoadingState)
                    do {
                        // PhotosPickerItem -> UIImage 변환
                        let images = try await imageService.convertPhotoToUIImage(photos)
                        send(.setUIImages(images))
                        let imagesData = imageService.convertUIImageToData(images)
                        send(.setImagesData(imagesData))
                    } catch {
                        print("error :: .setPhotos(photos)", error.localizedDescription)
                    }
                    send(.toggleLoadingState)
                }
            // isLoading 값 toggle
            case .toggleLoadingState:
                state.isLoading.toggle()
                return .none
            // 글 작성 새로고침 (이미지, 글 초기화)
            case .refresh:
                state.item.content = ""
                state.images = []
                return .run { @MainActor send in
                    send(.removeAllPhotos)
                }
            // 이미지 하나 지우기
            case let .removeImage(index):
                state.images.remove(at: index)
                return .run { @MainActor send in
                    send(.removePhoto(index))
                }
            // 선택된 사진 하나 지우기
            case let .removePhoto(index):
                state.selectedPhotos.remove(at: index)
                return .none
            // 선택된 사진 전체 지우기
            case .removeAllPhotos:
                state.selectedPhotos = []
                return .none
            }
        }
        .ifLet(\.$alert, action: \.alert)
    }
}

// MARK: - Alert in AddItemFeature
extension AlertState where Action == AddItemFeature.Action.Alert {
    
    // 저장 시, 작성된 내용이 없을 때
    static let isContentConfirm = Self {
        TextState("작성된 내용이 없어요!")
    } actions: {
        ButtonState(role: .cancel, action: .isNotEmptyContent) {
            TextState("확인")
        }
    }
}

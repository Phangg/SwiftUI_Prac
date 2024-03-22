//
//  DetailFeature.swift
//  MemoTCA1.9
//
//  Created by phang on 3/22/24.
//

import SwiftUI

import ComposableArchitecture

// MARK: - Detail Feature
@Reducer
struct DetailFeature {
    
    @ObservableState
    struct State: Equatable {
        @Presents var alert: AlertState<Action.Alert>?
        var item: Item
        var uiImages: [UIImage]
        var isEditing: Bool
        var beforeChangeContent: String
    }
    
    enum Action {
        case alert(PresentationAction<Alert>)
        case dataToImage([Data])
        case delegate(Delegate)
        case deleteButtonTapped
        case editButtonTapped
        case editContent(String)
        case saveButtonTapped
        case setUIImages([UIImage])
        case updateItemData(String)
        enum Alert: Equatable {
            case deleteConfirm(Item)
            case isNotEmptyContent
        }
        enum Delegate {
            case deleteConfirm(Item)
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.imageService) var imageService
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            // 삭제 확인 alert
            case .alert(.presented(.deleteConfirm)):
                return .run { [item = state.item ]send in
                    await send(.delegate(.deleteConfirm(item)))
                    await self.dismiss()
                }
            // 저장 할때, contents 가 있어야 가능
            case .alert(.presented(.isNotEmptyContent)):
                return .none
            //
            case .alert:
                return .none
            // item 의 imagesData -> [UIImage]
            case let .dataToImage(imagesData):
                return .run { @MainActor send in
                    let uiImages = imageService.convertDataToUIImage(imagesData)
                    send(.setUIImages(uiImages))
                }
            //
            case .delegate:
                return .none
            // 삭제 버튼 탭
            case .deleteButtonTapped:
                state.alert = .deleteConfirm(state.item)
                return .none
            // 수정 버튼 탭
            case .editButtonTapped:
                state.isEditing = true
                return .none
            // content 내용 수정
            case let .editContent(content):
                state.beforeChangeContent = content
                return .none
            // 저장 버튼 탭 (수정)
            case .saveButtonTapped:
                if state.beforeChangeContent.isEmpty {
                    state.alert = .isContentConfirm
                    return .none
                } else {
                    state.isEditing = false
                    return .run { [newContent = state.beforeChangeContent] send in
                        await send(.updateItemData(newContent))
                    }
                }
            // uiImages 에 변환 된 이미지 저장
            case let .setUIImages(uiImages):
                state.uiImages = uiImages
                return .none
            // 수정된 데이터 swift data 에 update
            case let .updateItemData(content):
                state.item.content = content
                return.none
            }
        }
        .ifLet(\.$alert, action: \.alert)
    }
}

// MARK: - Alert in DetailFeature
extension AlertState where Action == DetailFeature.Action.Alert {
    // 저장 시, 작성된 내용이 없을 때
    static let isContentConfirm = Self {
        TextState("작성된 내용이 없어요!")
    } actions: {
        ButtonState(role: .cancel, action: .isNotEmptyContent) {
            TextState("확인")
        }
    }
    
    // 삭제 알림
    static func deleteConfirm(_ item: Item) -> Self {
        Self {
            TextState("정말 삭제하시겠어요?")
        } actions: {
            ButtonState(role: .destructive, action: .deleteConfirm(item)) {
                TextState("삭제")
            }
        }
    }
}

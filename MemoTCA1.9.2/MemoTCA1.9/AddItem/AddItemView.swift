//
//  AddItemView.swift
//  MemoTCA1.9
//
//  Created by phang on 3/21/24.
//

import SwiftUI
import SwiftData
import PhotosUI

import ComposableArchitecture

// MARK: - Item 을 추가하는 Add Item View
struct AddItemView: View {
    @Bindable var store: StoreOf<AddItemFeature>
    @State private var selection = 0
    private let maxImages = 5
    
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            let maxWidth = size.width - 40
            // View 시작
            VStack(alignment: .center, spacing: 20) {
                // 사진 선택된 경우, 보여줄 공간
                Group {
                    // 사진 가져오는 중
                    if store.isLoading {
                        VStack(alignment: .center) {
                            ProgressView()
                        }
                    // 사진
                    } else if !store.selectedPhotos.isEmpty {
                        VStack {
                            // paging 스타일의 탭뷰로 구성
                            TabView(selection: $selection) {
                                ForEach(store.images.indices, id: \.self) { index in
                                    let uiImage = store.images[index]
                                    // 사진
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: maxWidth,
                                               height: size.height / 3 )
                                        .clipped()
                                        .tag(index)
                                        // 사진 삭제 버튼
                                        .overlay(alignment: .topTrailing) {
                                            Button {
                                                store.send(.removeImage(index))
                                            } label: {
                                                Image(systemName: "xmark.circle")
                                            }
                                            .padding(10)
                                        }
                                }
                                // 사진 최대 선택 개수보다 적을 때, + 버튼
                                if store.selectedPhotos.count < maxImages {
                                    PhotosPicker(selection: $store.selectedPhotos.sending(\.setPhotos),
                                                 maxSelectionCount: maxImages,
                                                 selectionBehavior: .default,
                                                 matching: .images,
                                                 photoLibrary: .shared()) {
                                        Image(systemName: "plus.rectangle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 70)
                                            .foregroundStyle(.pink)
                                    }.tag(store.images.count)
                                }
                            }
                            .tabViewStyle(.page(indexDisplayMode: .automatic))
                            .clipShape(.rect(cornerRadius: 10))
                        }
                    }
                }
                .frame(height: size.height / 3)
                .padding(.horizontal, 20)
                // content 작성 공간
                Form {
                    TextEditor(text: $store.item.content.sending(\.setContent))
                        .lineSpacing(4)
                        .autocorrectionDisabled(false)
                        .textInputAutocapitalization(.never)
                        .frame(minHeight: !store.selectedPhotos.isEmpty ? size.height / 3 : (size.height / 3) * 2,
                               maxHeight: size.height)
                }
                .frame(height: !store.selectedPhotos.isEmpty ? (size.height / 3) * 2 : size.height)
            }
            // 타이틀 - 작성 날짜 yyyy.mm.dd
            .navigationTitle(Formatter.dateToString(date: store.item.timestamp))
            .navigationBarTitleDisplayMode(.inline)
            // 네비 툴바
            .toolbar {
                // 내용 및 사진 있을 경우 -> 새로고침 - leading
                if !store.item.content.isEmpty ||
                   !store.images.isEmpty {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            store.send(.refresh)
                        } label: {
                            Image(systemName: "arrow.clockwise")
                        }
                    }
                }
                // 사진이 없을 경우 -> 사진 선택 (최초)
                if store.selectedPhotos.isEmpty {
                    ToolbarItem {
                        PhotosPicker(selection: $store.selectedPhotos.sending(\.setPhotos),
                                     maxSelectionCount: maxImages,
                                     selectionBehavior: .default,
                                     matching: .images,
                                     photoLibrary: .shared()) {
                            Image(systemName: "photo.badge.plus")
                        }
                    }
                }
                // 저장 버튼
                ToolbarItem {
                    Button {
                        store.send(.saveButtonTapped)
                    } label: {
                        Text("Save")
                            .fontWeight(.semibold)
                    }
                }
            }
            // 저장 시, 내용 없으면 alert
            .alert($store.scope(state: \.alert, action: \.alert))
        }
    }
}

#Preview {
    NavigationStack {
        AddItemView(
            store: Store(
                initialState: AddItemFeature.State(
                    item: Item(
                        id: UUID(),
                        content: "It's Test Data."),
                    selectedPhotos: [],
                    images: [],
                    isLoading: false
                )
            ) {
                AddItemFeature()
            }
        )
    }
}

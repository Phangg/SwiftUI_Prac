//
//  DetailView.swift
//  MemoTCA1.9
//
//  Created by phang on 3/22/24.
//

import SwiftUI

import ComposableArchitecture

// MARK: - item 리스트에서 내용 상세보기 페이지
struct DetailView: View {
    @Bindable var store: StoreOf<DetailFeature>
    @State private var selection = 0

    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            let maxWidth = size.width - 40
            // View 시작
            VStack(alignment: .center, spacing: 20) {
                if !store.item.imagesData.isEmpty {
                    // paging 스타일의 탭뷰로 구성
                    TabView(selection: $selection) {
                        ForEach(store.uiImages.indices, id: \.self) { index in
                            let uiImage = store.uiImages[index]
                            // 사진
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: maxWidth,
                                       height: size.height / 3 )
                                .clipped()
                                .tag(index)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .automatic))
                    .clipShape(.rect(cornerRadius: 10))
                    .frame(height: size.height / 3)
                    .padding(.horizontal, 20)
                }
                // content
                if !store.isEditing {
                    ScrollView {
                        Text(store.item.content)
                            .multilineTextAlignment(.leading)
                            .frame(minWidth: maxWidth, alignment: .leading)
                    }
                    .padding([.horizontal, .top], 20)
                    .scrollBounceBehavior(.basedOnSize, axes: .vertical)
                } else {
                    Form {
                        TextEditor(text: $store.beforeChangeContent.sending(\.editContent))
                            .lineSpacing(4)
                            .frame(minHeight: (size.height / 3) * 2,
                                   maxHeight: size.height)
                    }
                    .frame(height: (size.height / 3) * 2)
                }
            }
            // onAppear - 받아온 이미지 데이터 -> UIImage
            .task {
                store.send(.dataToImage(store.item.imagesData))
            }
            // 타이틀 - 작성 날짜 yyyy.mm.dd
            .navigationTitle(Formatter.dateToString(date: store.item.timestamp))
            .navigationBarTitleDisplayMode(.inline)
            .padding(.vertical, 20)
            // 네비 툴바
            .toolbar {
                if !store.isEditing {
                    // 수정 버튼
                    ToolbarItem {
                        Button {
                            store.send(.editButtonTapped)
                        } label: {
                            Image(systemName: "eraser")
                        }
                        .foregroundStyle(.red)
                    }
                    // 삭제 버튼
                    ToolbarItem {
                        Button {
                            store.send(.deleteButtonTapped)
                        } label: {
                            Image(systemName: "trash")
                        }
                        .foregroundStyle(.red)
                    }
                } else {
                    // 저장 버튼 (수정)
                    ToolbarItem {
                        Button {
                            store.send(.saveButtonTapped)
                        } label: {
                            Text("Save")
                                .fontWeight(.semibold)
                        }
                        .foregroundStyle(.red)
                    }
                }
            }
            // 삭제 확인 & 저장(content 있는지) alert
            .alert($store.scope(state: \.alert, action: \.alert))
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(
            store: Store(
                initialState: DetailFeature.State(
                    item: Item(
                        id: UUID(),
                        content: "It's Test Data."),
                        uiImages: [],
                        isEditing: false,
                        beforeChangeContent: ""
                )
            ) {
                DetailFeature()
            }
        )
    }
}

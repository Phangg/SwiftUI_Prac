//
//  MainView.swift
//  MemoTCA1.9
//
//  Created by phang on 3/20/24.
//

import SwiftUI
import SwiftData

import ComposableArchitecture

// MARK: - 메모 리스트를 볼 수 있는, Main View
struct MainView: View {
    @Bindable var store: StoreOf<MainViewFeature>
    
    var body: some View {
        // 네비게이션
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            // 리스트
            List {
                ForEach(store.items) { item in
                    NavigationLink(state: DetailFeature.State(item: item,
                                                              uiImages: [],
                                                              isEditing: false, beforeChangeContent: item.content)) {
                        HStack {
                            Text(item.content)
                                .lineLimit(1)
                                .multilineTextAlignment(.leading)
                                .font(.title2)
                        }
                    }
                }
                // 스와이프 삭제
                .onDelete { indexSet in
                    for index in indexSet {
                        store.send(.deleteItem(store.items[index]))
                    }
                }
            }
            // 타이틀
            .navigationTitle("Memo - TCA 1.9.2")
            // 네비 툴바
            .toolbar {
                // 아이템 추가 버튼
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        store.send(.addButtonTapped)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        // 네비게이션 Destination
        } destination: { store in
            DetailView(store: store)
        }
        // onAppear - items 받아오기
        .task {
            store.send(.onAppear)
        }
        // 삭제 시, alert
        .alert($store.scope(state: \.destination?.alert, action: \.destination.alert))
        // item 추가 화면 Sheet
        .sheet(item: $store.scope(state: \.destination?.addItem,
                                  action: \.destination.addItem)) { addItemStore in
            NavigationStack {
                AddItemView(store: addItemStore)
            }
        }
        .presentationDragIndicator(.hidden)
        .tint(.pink)
    }
}

#Preview {
    NavigationStack {
        MainView(
            store: Store(
                initialState: MainViewFeature.State(
                    items: [
                        Item(id: UUID(), content: "aaabbbccc"),
                        Item(id: UUID(), content: "cvbcvbcvb"),
                        Item(id: UUID(), content: "jkljkljkl"),
                        Item(id: UUID(), content: "asdasdasd")
                    ]
                )
            ) {
                MainViewFeature()
            }
        )
        .modelContainer(for: Item.self, inMemory: true)
    }
}

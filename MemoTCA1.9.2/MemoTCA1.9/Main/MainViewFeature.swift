//
//  MainViewFeature.swift
//  MemoTCA1.9
//
//  Created by phang on 3/21/24.
//

import Foundation

import ComposableArchitecture

// MARK: - Main View Reducer
@Reducer
struct MainViewFeature {

    @ObservableState
    struct State: Equatable {
        @Presents var destination: Destination.State?
        var items: IdentifiedArrayOf<Item> = []
        var path = StackState<DetailFeature.State>()
        
        mutating func fetchItems() {
            @Dependency(\.swiftData) var swiftData
            do {
                self.items = IdentifiedArray(uniqueElements: try swiftData.fetch())
            } catch {
                print("error :: fetchItems", error.localizedDescription)
            }
        }
    }
    
    enum Action {
        case addButtonTapped
        case onAppear
        case refetch
        case deleteItem(Item)
        case destination(PresentationAction<Destination.Action>)
        case path(StackAction<DetailFeature.State, DetailFeature.Action>)
        enum Alert: Equatable {
            case deleteConfirm(Item)
        }
    }
    
    @Dependency(\.uuid) var uuid
    @Dependency(\.swiftData) var swiftData
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            // 더하기 버튼 탭
            case .addButtonTapped:
                state.destination = .addItem(
                    AddItemFeature.State(
                        item: Item(id: self.uuid(), content: ""),
                        selectedPhotos: [],
                        images: [],
                        isLoading: false
                    )
                )
                return .none
            // SwiftData 에서 items 받아오기
            case .onAppear:
                state.fetchItems()
                return .none
            // SwiftData 에서 items 다시 받아오기
            case .refetch:
                state.fetchItems()
                return .none
            // Delete - 스와이프 삭제 / alert 띄우기
            case let .deleteItem(item):
                state.destination = .alert(.deleteConfirm(item: item))
                return .none
            // AddItemView - 'Save' 버튼 탭
            case let .destination(.presented(.addItem(.delegate(.saveItem(item))))):
                do {
                    try swiftData.add(item)
                } catch {
                    print("error :: swiftData.add", error.localizedDescription)
                }
                return .run { send in
                    await send(.refetch)
                }
            // 삭제 OK -> SwiftData 에서 item 삭제
            case let .destination(.presented(.alert(.deleteConfirm(item)))):
                do {
                    try swiftData.delete(item)
                } catch {
                    print("error :: swiftData.delete", error.localizedDescription)
                }
                return .run { send in
                    await send(.refetch)
                }
            //
            case .destination:
                return .none
            // 해당 path id 의 item 삭제
            case let .path(.element(id: id, action: .delegate(.deleteConfirm(item)))):
                guard let _ = state.path[id: id] else { return .none }
                do {
                    try swiftData.delete(item)
                } catch {
                    print("error :: swiftData.delete", error.localizedDescription)
                }
                return .run { send in
                    await send(.refetch)
                }
            //
            case .path:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
        .forEach(\.path, action: \.path) {
            DetailFeature()
        }
    }
}

// MARK: - Destination
extension MainViewFeature {
    @Reducer(state: .equatable)
    enum Destination {
        case addItem(AddItemFeature)
        case alert(AlertState<MainViewFeature.Action.Alert>)
    }
}

// MARK: - Alert in MainViewFeature
extension AlertState where Action == MainViewFeature.Action.Alert {
    
    // 삭제 알림
    static func deleteConfirm(item: Item) -> Self {
        Self {
            TextState("정말 삭제하시겠어요?")
        } actions: {
            ButtonState(role: .destructive, action: .deleteConfirm(item)) {
                TextState("삭제")
            }
        }
    }
}

//
//  AddContactFeature.swift
//  TutoralTCA
//
//  Created by phang on 3/14/24.
//

import Foundation

import ComposableArchitecture

// MARK: - AddContactFeature Reducer
@Reducer
struct AddContactFeature {
    
    @ObservableState
    struct State: Equatable {
        var contact: Contact
    }
    
    enum Action {
        case cancelButtonTapped
        case delegate(Delegate)
        case saveButtonTapped
        case setName(String)
        @CasePathable // casePath - enum 을 사용할 때 keypath처럼 사용할 수 있도록..
        enum Delegate: Equatable {
            case saveContact(Contact) // 저장 기능 delegate
        }
    }
    
    // dismiss
    @Dependency(\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            // 취소 버튼
            case .cancelButtonTapped:
                return .run { _ in await self.dismiss() }
            //
            case .delegate:
                return .none
            // 저장 버튼
            case .saveButtonTapped:
                return .run { [contact = state.contact] send in
                    await send(.delegate(.saveContact(contact)))
                    await self.dismiss()
                }
            // 이름 설정
            case let .setName(name):
                state.contact.name = name
                return .none
            }
        }
    }
}

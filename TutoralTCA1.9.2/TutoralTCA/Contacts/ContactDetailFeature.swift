//
//  ContactDetailFeature.swift
//  TutoralTCA
//
//  Created by phang on 3/16/24.
//

import Foundation

import ComposableArchitecture

// MARK: - ContactDetailFeature Reducer
@Reducer
struct ContactDetailFeature {
    
    @ObservableState
    struct State: Equatable {
        @Presents var alert: AlertState<Action.Alert>? // 내장된 AlertState 관찰
        let contact: Contact
    }
    
    enum Action {
        case alert(PresentationAction<Alert>)
        case delegate(Delegate)
        case deleteButtonTapped
        enum Alert {
            case confirmDeletion // 삭제 기능 delegate
        }
        enum Delegate {
            case confirmDeletion // 삭제 기능 delegate
        }
    }
    
    // dismiss
    @Dependency(\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            // 삭제 버튼 클릭 시, Alert 띄우기
            case .alert(.presented(.confirmDeletion)):
                return .run { send in
                    await send(.delegate(.confirmDeletion))
                    await self.dismiss()
                }
            //
            case .alert:
                return .none
            //
            case .delegate:
                return .none
            // 삭제 버튼
            case .deleteButtonTapped:
                state.alert = .confirmDeletion
                return .none
            }
        }
        .ifLet(\.$alert, action: \.alert)
    }
}

extension AlertState where Action == ContactDetailFeature.Action.Alert {
    static let confirmDeletion = Self {
        TextState("Are you sure?")
    } actions: {
        ButtonState(role: .destructive, action: .confirmDeletion) {
            TextState("Delete")
        }
    }
}

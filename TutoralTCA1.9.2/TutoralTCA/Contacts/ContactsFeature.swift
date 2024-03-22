//
//  ContactsFeature.swift
//  TutoralTCA
//
//  Created by phang on 3/14/24.
//

import Foundation

import ComposableArchitecture

// MARK: - Contact 모델
struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}

// MARK: - ContactsFeature Reducer
@Reducer
struct ContactsFeature {
    
    @ObservableState
    struct State: Equatable {
        var contacts: IdentifiedArrayOf<Contact> = [] // Contact 배열
        @Presents var destination: Destination.State? // Destination 리듀서 상태 관찰
        var path = StackState<ContactDetailFeature.State>() // NavigationStack 사용 path
    }
    
    enum Action {
        case addButtonTapped
        case deleteButtonTapped(id: Contact.ID)
        case destination(PresentationAction<Destination.Action>)
        case path(StackAction<ContactDetailFeature.State, ContactDetailFeature.Action>)
        enum Alert: Equatable {
            case confirmDeletion(id: Contact.ID)
        }
    }
    
    // == UUID()
    @Dependency(\.uuid) var uuid
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            // 추가 버튼
            case .addButtonTapped:
                state.destination = .addContact(
                    AddContactFeature.State(
                        contact: Contact(id: self.uuid(), name: "")
                    )
                )
                return .none
            // destination -> contact 추가 / 저장
            case let .destination(.presented(.addContact(.delegate(.saveContact(contact))))):
                state.contacts.append(contact)
                return .none
            // destination -> 삭제
            case let .destination(.presented(.alert(.confirmDeletion(id: id)))):
                state.contacts.remove(id: id)
                return .none
            //
            case .destination:
                return .none
            // 삭제 버튼 클릭 시, Alert 띄우기
            case let .deleteButtonTapped(id: id):
                state.destination = .alert(.deleteConfirmation(id: id))
                return .none
            // 해당 path id 의 contact 삭제
            case let .path(.element(id: id, action: .delegate(.confirmDeletion))):
                guard let detailState = state.path[id: id] else { return .none }
                state.contacts.remove(id: detailState.contact.id)
                return .none
            //
            case .path:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination) // 하위 리듀서를 포함 ( PresentationAction )
        .forEach(\.path, action: \.path) { // 하위 리듀서를 포함 ( StackAction )
            ContactDetailFeature()
        }
    }
}

// MARK: - Destination 리듀서 하나에서 두개의 리듀서를 관리
extension ContactsFeature {
    @Reducer(state: .equatable)
    enum Destination {
        case addContact(AddContactFeature)
        case alert(AlertState<ContactsFeature.Action.Alert>)
    }
}

// MARK: - Alert 동작 감싸기 ( Test Code 사용 용이 및 코드 정리 )
extension AlertState where Action == ContactsFeature.Action.Alert {
    static func deleteConfirmation(id: UUID) -> Self {
        Self {
            TextState("Are you sure?")
        } actions: {
            ButtonState(role: .destructive, action: .confirmDeletion(id: id)) {
                TextState("Delete")
            }
        }
    }
}

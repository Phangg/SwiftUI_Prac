//
//  ContactsView.swift
//  TutoralTCA
//
//  Created by phang on 3/14/24.
//

import SwiftUI

import ComposableArchitecture

// MARK: - Contacts View
struct ContactsView: View {
    // ContactsFeature 리듀서 도메인의 Store 를 참조
    @Bindable var store: StoreOf<ContactsFeature>
    
    var body: some View {
        // Navigation Stack 에서 ContactsFeature 의 path 사용
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            List {
                ForEach(store.contacts) { contact in
                    // Navigation ( store 의 state 를 전달 )
                    NavigationLink(state: ContactDetailFeature.State(contact: contact)) {
                        HStack {
                            Text(contact.name)
                            Spacer()
                            Button {
                                store.send(.deleteButtonTapped(id: contact.id))
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                    .buttonStyle(.borderless)
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem {
                    Button {
                        store.send(.addButtonTapped)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        // Navigation Destination
        } destination: { store in
            ContactDetailView(store: store)
        }
        .sheet(item: $store.scope(state: \.destination?.addContact, action: \.destination.addContact)) { addContactStore in
            NavigationStack {
                AddContactView(store: addContactStore)
            }
        }
        // 삭제 시, alert
        .alert($store.scope(state: \.destination?.alert, action: \.destination.alert))
    }
}

#Preview {
    NavigationStack {
        ContactsView(
            store:
                Store(
                    initialState: ContactsFeature.State(
                        contacts: [
                            Contact(id: UUID(), name: "Phang"),
                            Contact(id: UUID(), name: "Phang Jr"),
                            Contact(id: UUID(), name: "Phang Sr"),
                        ]
                    )
                ) {
                    ContactsFeature()
                }
        )
    }
}

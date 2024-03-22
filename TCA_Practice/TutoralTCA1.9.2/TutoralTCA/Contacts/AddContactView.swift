//
//  AddContactView.swift
//  TutoralTCA
//
//  Created by phang on 3/14/24.
//

import SwiftUI

import ComposableArchitecture

// MARK: - Add Contact View
struct AddContactView: View {
    // AddContactFeature 리듀서 도메인의 Store 를 참조
    @Bindable var store: StoreOf<AddContactFeature>
    
    var body: some View {
        Form {
            TextField("Name", text: $store.contact.name.sending(\.setName))
            Button("Save") {
                store.send(.saveButtonTapped)
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    store.send(.cancelButtonTapped)
                } label: {
                    Text("Cancel")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddContactView(
            store: Store(
                initialState: AddContactFeature.State(
                    contact: Contact(
                        id: UUID(),
                        name: "Phang"
                    )
                )
            ) {
                AddContactFeature()
            }
        )
    }
}

//
//  ContactDetailView.swift
//  TutoralTCA
//
//  Created by phang on 3/16/24.
//

import SwiftUI

import ComposableArchitecture

// MARK: - Contact Detail View
struct ContactDetailView: View {
    // ContactDetailFeature 리듀서 도메인의 Store 를 참조
    @Bindable var store: StoreOf<ContactDetailFeature>
    
    var body: some View {
        Form {
            Button {
                store.send(.deleteButtonTapped)
            } label: {
                Text("Delete")
            }
        }
        .navigationTitle(Text(store.contact.name))
        // 삭제 시, alert
        .alert($store.scope(state: \.alert, action: \.alert))
    }
}

#Preview {
    NavigationStack {
        ContactDetailView(
            store: Store(
                initialState: ContactDetailFeature.State(
                    contact: Contact(id: UUID(), name: "Phang")
                )
            ) {
                ContactDetailFeature()
            }
        )
    }
}

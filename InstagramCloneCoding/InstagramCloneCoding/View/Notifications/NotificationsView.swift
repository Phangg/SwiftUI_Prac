//
//  NotificationsView.swift
//  InstagramCloneCoding
//
//  Created by phang on 12/27/23.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<20) { _ in
                    NotificationCell()
                        .padding(.top)
                }
            }
        }
    }
}

#Preview {
    NotificationsView()
}

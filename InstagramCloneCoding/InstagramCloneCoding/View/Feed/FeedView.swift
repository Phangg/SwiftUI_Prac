//
//  FeedView.swift
//  InstagramCloneCoding
//
//  Created by phang on 12/27/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<20) { _ in
                FeedCell()
            }
        }
    }
}

#Preview {
    FeedView()
}

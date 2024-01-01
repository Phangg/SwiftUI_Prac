//
//  PostGridView.swift
//  InstagramCloneCoding
//
//  Created by phang on 1/1/24.
//

import SwiftUI

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        GeometryReader { geo in
            LazyVGrid(columns: items, spacing: 2) {
                ForEach(0..<10) { _ in
                    NavigationLink {
                        FeedView()
                    } label: {
                        Image("cat")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width / CGFloat(items.count),
                                   height: geo.size.width / CGFloat(items.count))
                            .clipped()
                    }
                }
            }
        }
    }
}

#Preview {
    PostGridView()
}

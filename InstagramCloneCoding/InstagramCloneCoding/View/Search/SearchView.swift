//
//  SearchView.swift
//  InstagramCloneCoding
//
//  Created by phang on 12/27/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var inSearchMode = false
    
    var body: some View {
        ScrollView {
            // 서치 바
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            ZStack {
                if inSearchMode {
                    // 유저 리스트
                    UserListView()
                } else {
                    // 그리드 아이템
                    PostGridView()
                }
            }
        }
    }
}

#Preview {
    SearchView()
}

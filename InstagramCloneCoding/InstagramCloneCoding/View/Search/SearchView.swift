//
//  SearchView.swift
//  InstagramCloneCoding
//
//  Created by phang on 12/27/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        
        ScrollView {
            // 서치 바
            SearchBar(text: $searchText)
                .padding()
            // 그리드 아이템
            PostGridView()
            
            // 유저 리스트
//            UserListView()
        }
    }
}

#Preview {
    SearchView()
}

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
            
        }
    }
}

#Preview {
    SearchView()
}

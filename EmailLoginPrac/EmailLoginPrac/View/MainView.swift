//
//  MainView.swift
//  EmailLoginPrac
//
//  Created by phang on 1/10/24.
//

import SwiftUI

struct MainView: View {
    // user 뷰 모델
    @EnvironmentObject private var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("Hi, \(userViewModel.userName ?? "????") - !")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(UserViewModel())
}

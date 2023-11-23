//
//  MainView.swift
//  SocialLoginTest
//
//  Created by phang on 11/23/23.
//

import SwiftUI
import NaverThirdPartyLogin

struct MainView: View {
    @EnvironmentObject private var viewModel: LoginViewModel
    
    var body: some View {
        VStack(spacing: 48) {
            if let platform = viewModel.platform {
                Text("\(platform.name)")
            }
            Text("이름: \(viewModel.name)")
            Text("이메일: \(viewModel.email)")
            Divider()
                .frame(height: 2)
                .background(Color.gray)
            Button {
                NaverThirdPartyLoginConnection
                    .getSharedInstance()
                    .requestDeleteToken()
            } label: {
                 Text("Logout")
                    .font(.title3)
            }
            .buttonStyle(.bordered)
            .tint(.red)
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    MainView().environmentObject(LoginViewModel())
}

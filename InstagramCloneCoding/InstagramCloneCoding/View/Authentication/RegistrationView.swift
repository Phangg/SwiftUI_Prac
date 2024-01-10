//
//  RegistrationView.swift
//  InstagramCloneCoding
//
//  Created by phang on 1/10/24.
//

import SwiftUI
import PhotosUI

struct RegistrationView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var fullName = ""
    @State private var userName = ""
    @State private var password = ""
    @State private var selectedImage: PhotosPickerItem?
    @State private var postImage: Image?

    var body: some View {
        ZStack {
            // 배경색
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea(.all)
            
            VStack {
                Group {
                    if let image = postImage {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 140, height: 140)
                            .clipShape(.circle)
                    } else {
                        PhotosPicker(selection: $selectedImage, matching: .images) {
                            Image(systemName: "photo.badge.plus")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 140, height: 140)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .padding(10)
                
                VStack(spacing: 20) {
                    // 이메일
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .modifier(LoginTextField())
                    // fullName
                    CustomTextField(text: $email, placeholder: Text("fullName"), imageName: "person")
                        .modifier(LoginTextField())
                    // userName
                    CustomTextField(text: $email, placeholder: Text("userName"), imageName: "person")
                        .modifier(LoginTextField())
                    // 비밀번호
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .modifier(LoginTextField())
                }
                
                // 로그인
                Button {
                    //
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 340, height: 50)
                        .background(.purple.opacity(0.85))
                        .clipShape(.capsule)
                        .padding()
                }
                
                Spacer()
                
                // 회원 가입
                Button {
                    dismiss()
                } label: {
                    HStack(alignment: .lastTextBaseline) {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundStyle(.white)
                }
                .padding(.bottom, 16)
            }
            .padding(.top, 24)
        }
        .navigationBarBackButtonHidden()
        .task(id: selectedImage) {
            postImage = try? await selectedImage?.loadTransferable(type: Image.self)
        }
    }
}

#Preview {
    RegistrationView()
}

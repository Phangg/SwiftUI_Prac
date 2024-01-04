//
//  UploadPostView.swift
//  InstagramCloneCoding
//
//  Created by phang on 12/27/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var selectedImage: PhotosPickerItem?
    @State private var postImage: Image?
    @State private var captionText = ""
    
    var body: some View {
        VStack {
            if postImage == nil {
                
                // 사진 추가 버튼
                PhotosPicker(selection: $selectedImage, matching: .images) {
                    Image(systemName: "photo.badge.plus")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .padding(.top, 50)
                        .foregroundStyle(.black)
                }
            } else {
                
                //
                HStack(alignment: .top) {
                    Image("cat")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    TextField("Enter your caption..", text: $captionText)
                }
                
                //
                Button {
                    //
                } label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .clipShape(.rect(cornerRadius: 5))
                        .foregroundStyle(.white)
                }
                .padding()
            }
            
            Spacer()
        }
        .task(id: selectedImage) {
            postImage = try? await selectedImage?.loadTransferable(type: Image.self)
        }
    }
}

#Preview {
    UploadPostView()
}

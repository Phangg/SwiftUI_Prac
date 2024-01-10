//
//  CustomTextField.swift
//  InstagramCloneCoding
//
//  Created by phang on 1/10/24.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
                
                TextField("", text: $text, prompt: placeholder.foregroundStyle(.white.opacity(0.8)))
                    .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    CustomTextField(text: .constant(""), placeholder: Text("Email"), imageName: "envelope")
}

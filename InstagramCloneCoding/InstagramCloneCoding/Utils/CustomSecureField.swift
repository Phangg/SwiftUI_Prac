//
//  CustomSecureField.swift
//  InstagramCloneCoding
//
//  Created by phang on 1/10/24.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
                
                SecureField("", text: $text, prompt: placeholder.foregroundStyle(.white.opacity(0.8)))
                    .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    CustomSecureField(text: .constant(""), placeholder: Text("Password"))
}

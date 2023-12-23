//
//  ContentView.swift
//  CustomButtons
//
//  Created by phang on 12/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Button {
                    // not action, just button design
                } label: {
                    Text("Filled Button")
                        .modifier(FilledButton(fontColor: .white,
                                               backgroundColor: .black,
                                               height: 52))
                }
                
                Button {
                    // not action, just button design
                } label: {
                    Text("Border Button")
                        .modifier(BorderButton(color: .black,
                                               height: 52))
                }
                
                Button {
                    // not action, just button design
                } label: {
                    Text("Dashed Border Button")
                        .modifier(DashedBorderButton(color: .black,
                                                     height: 52))
                }
                
                Button {
                    // not action, just button design
                } label: {
                    Text("Text Wrapped Button")
                        .modifier(TextWrappedButton(fontColor: .white,
                                                    backgroundColor: .black))
                }
                
                Button {
                    // not action, just button design
                } label: {
                    Image(systemName: "heart.fill")
                        .modifier(IconButton(fontColor: .white,
                                             backgroundColor: .black,
                                             size: 52))
                }
                
                Button {
                    // not action, just button design
                } label: {
                    Image(systemName: "heart.fill")
                        .modifier(CircleIconButton(fontColor: .white,
                                             backgroundColor: .black,
                                             size: 52))
                }

                Button {
                    // not action, just button design
                } label: {
                    Text("Link Button")
                        .modifier(LinkButton(color: .black,
                                             height: 52))
                }
                
                RadioButton()
                
                CheckmarkButton()
                
                CheckmarkButton2()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  testAlarmSetting
//
//  Created by phang on 3/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    SettingView()
                } label: {
                    Text("SettingView")
                        .font(.largeTitle)
                }
            }
        }
        .tint(.orange)
    }
}

#Preview {
    ContentView()
}

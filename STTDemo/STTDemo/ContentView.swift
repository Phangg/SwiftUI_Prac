//
//  ContentView.swift
//  STTDemo
//
//  Created by phang on 12/4/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isTranscribing: Bool = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 40) {
            Text("Speech To Text")
                .font(.largeTitle)
                .fontWeight(.bold)
            Divider()
            Text(speechRecognizer.transcript)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            Spacer()
            Divider()
            Button {
                if isTranscribing {
                    Task {
                        await speechRecognizer.stopTranscribing()
                        isTranscribing = false
                    }
                } else {
                    Task {
                        await speechRecognizer.resetTranscript()
                        await speechRecognizer.startTranscribing()
                        isTranscribing = true
                    }
                }
            } label: {
                Circle()
                    .fill(colorScheme == .dark ? .white : .black.opacity(0.8))
                    .frame(width: 60, height: 60)
                    .overlay {
                        Circle()
                            .fill(colorScheme == .dark ? .black : .white)
                            .frame(width: 50, height: 50)
                    }
                    .overlay {
                        Circle()
                            .fill(isTranscribing ? .gray : .red)
                            .frame(width: 45, height: 45)
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

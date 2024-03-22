//
//  CounterView.swift
//  TutoralTCA
//
//  Created by phang on 3/16/24.
//

import SwiftUI

import ComposableArchitecture

// MARK: - Counter View
struct CounterView: View {
    // CounterFeature 리듀서 도메인의 Store 를 참조
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        VStack(spacing: 20) {
            // Counting Number
            Text("\(store.count)")
                .font(.largeTitle)
            // - / + Buttons
            HStack {
                // Decrement Button
                Button {
                    store.send(.decrementButtonTapped)
                } label: {
                    Text("-")
                }
                .modifier(CounterButtonViewModifier())
                // Increment Button
                Button {
                    store.send(.incrementButtonTapped)
                } label: {
                    Text("+")
                }
                .modifier(CounterButtonViewModifier())
            }
            // Timer Button
            Button {
                store.send(.toggleTimerButtonTapped)
            } label: {
                Text(store.isTimerRunning ? "Stop Timer" : "Start Timer")
            }
            .modifier(CounterButtonViewModifier())
            // Fact Button
            Button {
                store.send(.factButtonTapped)
            } label: {
                Text("Fact")
            }
            .modifier(CounterButtonViewModifier())
            // Fact Text
            if store.isLoading {
                ProgressView()
            } else if let fact = store.fact {
                Text(fact)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}

// MARK: - Counter View 에서 사용되는 버튼의 View Modifier
private struct CounterButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(Color.black)
            .frame(minWidth: 30, minHeight: 30)
            .padding()
            .background(Color.black.opacity(0.1))
            .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    CounterView(
        store: Store(initialState: CounterFeature.State()) {
            CounterFeature()
        }
    )
}

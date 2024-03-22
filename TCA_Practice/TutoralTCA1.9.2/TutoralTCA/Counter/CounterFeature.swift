//
//  CounterFeature.swift
//  TutoralTCA
//
//  Created by phang on 3/13/24.
//

import SwiftUI

import ComposableArchitecture

// MARK: - CounterFeature Reducer
@Reducer
struct CounterFeature {
    
    @ObservableState
    struct State: Equatable {
        var count = 0
        var fact: String?
        var isLoading = false
        var isTimerRunning = false
    }
    
    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
        case factButtonTapped
        case factResponse(String)
        case toggleTimerButtonTapped
        case timerTick
    }
    // Cancellable 에서 사용할 enum
    enum CancelID { case timer }
    
    // 타이머
    @Dependency(\.continuousClock) var clock
    // 숫자에 대한 String 받아오는 API 사용 커스텀 Dependency
    @Dependency(\.numberFact) var numberFact

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            // 숫자 감소 버튼
            case .decrementButtonTapped:
                state.count -= 1
                state.fact = nil
                return .none
            // 숫자 증가 버튼
            case .incrementButtonTapped:
                state.count += 1
                state.fact = nil
                return .none
            // 숫자 관련 String 받기 버튼
            case .factButtonTapped:
                state.fact = nil
                state.isLoading = true
                return .run { [count = state.count] send in
                    do {
                        try await send(.factResponse(self.numberFact.fetch(count)))
                    } catch {
                        print("error :: factButtonTapped()", error.localizedDescription)
                        await send(.factResponse("Error!\n\(error.localizedDescription)"))
                    }
                }
            // 숫자 관련 String 받기 완료
            case let .factResponse(fact):
                state.fact = fact
                state.isLoading = false
                return .none
            // 타이머 버튼
            case .toggleTimerButtonTapped:
                state.isTimerRunning.toggle()
                if state.isTimerRunning {
                    return .run { send in
                        for await _ in self.clock.timer(interval: .seconds(1)) {
                            await send(.timerTick)
                        }
                    }
                    .cancellable(id: CancelID.timer)
                } else {
                    return .cancel(id: CancelID.timer)
                }
            // 타이머 카운팅
            case .timerTick:
                state.count += 1
                state.fact = nil
                return .none
            }
        }
    }
}

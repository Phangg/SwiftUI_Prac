//
//  SettingView.swift
//  testAlarmSetting
//
//  Created by phang on 3/14/24.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.scenePhase) private var scenePhase

    @State private var isAlarmOn: Bool = false // 알람 설정 toggle

    var body: some View {
        // alarm 토글 버튼 액션 추가
        let alarmToggleBinding = Binding {
            isAlarmOn
        } set: {
            openAppSettings(notUsed: $0)
        }
        // View
        VStack {
            Toggle(isOn: alarmToggleBinding) {
                Text("알림 설정")
            }
            .tint(.orange)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
        .onAppear {
            getSystemAlarmSetting()
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            // 앱이 백그라운드에서 포그라운드로 전환될 때 실행할 작업
            case .active:
                getSystemAlarmSetting()
            // 그 외
            default:
                print("isAlarmOn :", isAlarmOn)
                break
            }
        }
    }
    
    private func getSystemAlarmSetting() {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { settings in
            switch settings.alertSetting {
            // 허용한 상태일 경우
            case .enabled:
                // TODO: - 파베 유저 데이터의 알림 허용 상태 X 경우, 파베에 허용 O 로 업데이트
                print("파베에 허용 O 로 업데이트")
                self.isAlarmOn = true
            // 허용하지 않은 상태 + 나머지 모든 경우
            default:
                // TODO: - 파베 유저 데이터의 알림 허용 상태 O 경우, 파베에 허용 X 로 업데이트
                print("파베에 허용 X 로 업데이트")
                self.isAlarmOn = false
            }
        }
    }

    private func openAppSettings(notUsed value: Bool) {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsURL) {
            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
        }
    }
}

#Preview {
    SettingView()
}

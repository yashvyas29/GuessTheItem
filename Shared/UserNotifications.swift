//
//  UserNotifications.swift
//  UserNotifications
//
//  Created by global on 12/09/21.
//

import SwiftUI

struct UserNotifications: View {
    var body: some View {
        Button {
            checkPermissionAndAddNotification()
        } label: {
            Text("Local Notification")
        }
        .padding()
        .background(Color.red)
        .foregroundColor(Color.white)
        .clipShape(Capsule())
    }

    private func checkPermissionAndAddNotification() {
        let center = UNUserNotificationCenter.current()
        let addNotification = {
            let content = UNMutableNotificationContent()
            content.title = "Local Notification"
            content.subtitle = "Checking user notifications."
            content.sound = .default
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request) { error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }

        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .authorized {
                addNotification()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addNotification()
                    } else {
                        print(error?.localizedDescription ?? "Unknown error")
                    }
                }
            }
        }
    }
}

struct UserNotifications_Previews: PreviewProvider {
    static var previews: some View {
        UserNotifications()
    }
}

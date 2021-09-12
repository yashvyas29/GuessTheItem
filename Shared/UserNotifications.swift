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
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    let content = UNMutableNotificationContent()
                    content.title = "Local Notification"
                    content.subtitle = "Checking user notifications."
                    content.sound = .default
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request) { error in
                        if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                } else {
                    print(error?.localizedDescription ?? "Unknown error")
                }
            }
        } label: {
            Text("Local Notification")
        }
        .padding()
        .background(Color.red)
        .foregroundColor(Color.white)
        .clipShape(Capsule())
    }
}

struct UserNotifications_Previews: PreviewProvider {
    static var previews: some View {
        UserNotifications()
    }
}

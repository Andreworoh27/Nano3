//
//  NotificationManager.swift
//  Nano3
//
//  Created by Ryan Kusnadi on 16/07/24.
//

import Foundation
import UserNotifications

class NotificationManager: ObservableObject {
    @Published var isNotifAuthGiven: Bool = UserDefaults.standard.bool(forKey: "isNotifAuthGiven")
    
    init() {
        requestNotifPermission()
    }
    
    func requestNotifPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            DispatchQueue.main.async {
                if success {
                    self.isNotifAuthGiven = true
                    UserDefaults.standard.set(true, forKey: "isNotifAuthGiven")
                    self.scheduleDailyNotification()
                    print("DEBUG: Permissions provided")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func scheduleDailyNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Check the weather today!"
        content.body = "Remember to start your day right!"
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = 6
        dateComponents.minute = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("DEBUG: Notification scheduled for 6 AM daily")
            }
        }
    }
}

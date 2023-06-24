//
//  NotificationHandler.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import Foundation
import UserNotifications

class NotificationHandler {
    
    var notification = Notification()
    
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in}
    }
    
    func sendNotification(title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let identifier = UUID().uuidString
        
        let timeInterval: Double = 10
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
}

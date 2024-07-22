//
//  Activity.swift
//  NavStack
//
//  Created by TumbaDev on 22.07.24.
//

import SwiftUI
import Foundation

struct Activity: Identifiable {
    let id = UUID().uuidString
    var preview: Image
    var title: String
    var startTime: Date?
    var endTime: Date?
    var date: Date
    var place: String?
    var description: String?

    func formatTime(_ time: Date?) -> String {
        guard let time = time else { return "N/A" }
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: time)
    }

    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}


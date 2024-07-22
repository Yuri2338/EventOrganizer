//
//  ActivityManager.swift
//  NavStack
//
//  Created by TumbaDev on 22.07.24.
//

import SwiftUI

class ActivityManager: ObservableObject {
    @Published var activities: [Activity] = []

    init() {
        self.activities = getEvents()
    }

    func addActivity(_ activity: Activity) {
        activities.append(activity)
    }
}

func createDate(from dateString: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: dateString) ?? Date()
}

func addTime(to date: Date, hours: Int, minutes: Int) -> Date {
    var calendar = Calendar.current
    calendar.timeZone = TimeZone.current
    var dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
    dateComponents.hour = hours
    dateComponents.minute = minutes
    return calendar.date(from: dateComponents) ?? date
}

func getEvents() -> [Activity] {
    return [
        .init(
            preview: Image(systemName: "cup.and.saucer"),
            title: "Tea Party",
            startTime: addTime(to: createDate(from: "2024-07-22"), hours: 18, minutes: 0),
            endTime: addTime(to: createDate(from: "2024-07-22"), hours: 20, minutes: 0),
            date: createDate(from: "2024-07-22"),
            place: "My House",
            description: """
            Silly cat friendly tea party in celebration of my cat's 12 year anniversary. \
            All of his cat friends are invited, his cat girlfriend is no exception. \
            She will tell him the surprise news then. They are having kittens!
            """
        ),
        .init(
            preview: Image(systemName: "sun.max"),
            title: "Mountain Hike",
            startTime: addTime(to: createDate(from: "2024-07-26"), hours: 6, minutes: 0),
            endTime: addTime(to: createDate(from: "2024-07-26"), hours: 10, minutes: 0),
            date: createDate(from: "2024-07-26"),
            place: "Mountain Trail",
            description: """
            Early morning mountain hike with friends to enjoy the sunrise and the cool breeze. \
            The trail is moderate, suitable for all fitness levels. \
            Don't forget to bring water, snacks, and a camera to capture the stunning views.
            """
        ),
        .init(
            preview: Image(systemName: "cart"),
            title: "Grocery Shopping",
            startTime: addTime(to: createDate(from: "2024-07-27"), hours: 11, minutes: 0),
            endTime: addTime(to: createDate(from: "2024-07-27"), hours: 12, minutes: 0),
            date: createDate(from: "2024-07-27"),
            place: "Supermarket",
            description: """
            Quick trip to the grocery store to stock up on fresh produce and essentials. \
            We have a list of ingredients for tonight's dinner and some snacks for the week. \
            Remember to bring reusable bags to reduce plastic waste.
            """
        ),
        .init(
            preview: Image(systemName: "person.2"),
            title: "Team Meeting",
            startTime: addTime(to: createDate(from: "2024-07-28"), hours: 14, minutes: 0),
            endTime: addTime(to: createDate(from: "2024-07-28"), hours: 15, minutes: 0),
            date: createDate(from: "2024-07-28"),
            place: "Conference Room",
            description: """
            Monthly team meeting to discuss project updates and future plans. \
            Each team member will present their progress and any challenges they are facing. \
            There will be a brainstorming session for new ideas and improvements.
            """
        ),
        .init(
            preview: Image(systemName: "film"),
            title: "Going to the Movies",
            startTime: addTime(to: createDate(from: "2024-07-29"), hours: 19, minutes: 0),
            endTime: addTime(to: createDate(from: "2024-07-29"), hours: 21, minutes: 0),
            date: createDate(from: "2024-07-29"),
            place: "Local Theater",
            description: """
            Evening outing to watch the latest blockbuster movie at the local theater. \
            We'll meet in the lobby at 18:45 to buy tickets and snacks. \
            After the movie, there's an option to grab dinner and discuss the film.
            """
        )
    ]
}

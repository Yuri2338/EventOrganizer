//
//  AddEventView.swift
//  NavStack
//
//  Created by TumbaDev on 22.07.24.
//

import SwiftUI

struct AddEventView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var activityManager: ActivityManager

    @State private var title: String = ""
    @State private var startTime: Date? = nil
    @State private var endTime: Date? = nil
    @State private var date: Date = Date()
    @State private var place: String = ""
    @State private var description: String = ""
    @State private var selectedIcon: String = "calendar"

    let availableIcons = ["calendar", "cup.and.saucer", "sun.max", "cart", "person.2", "film", "heart", "book", "gamecontroller", "paintbrush", "car", "bicycle", "airplane", "bed.double", "fork.knife", "graduationcap", "hammer", "house", "music.note", "pawprint", "phone", "scissors", "star", "ticket", "tv", "wrench.and.screwdriver"]

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Event Details")) {
                    TextField("Title", text: $title)
                    
                    DatePicker("Start Time", selection: Binding($startTime, default: Date()), displayedComponents: [.hourAndMinute])
                    
                    DatePicker("End Time", selection: Binding($endTime, default: Date()), displayedComponents: [.hourAndMinute])
                    
                    DatePicker("Date", selection: $date, displayedComponents: [.date])
                    
                    TextField("Place", text: $place)
                    TextField("Description", text: $description, axis: .vertical)
                    
                    Picker("Icon", selection: $selectedIcon) {
                        ForEach(availableIcons, id: \.self) { icon in
                            Label(icon, systemImage: icon).tag(icon)
                        }
                    }
                }
            }
            .navigationTitle("Add New Event")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveEvent()
                    }
                }
            }
        }
    }

    private func saveEvent() {
        guard !title.isEmpty else {
            // Handle validation errors
            return
        }

        if let startTime = startTime, let endTime = endTime, startTime >= endTime {
            // Handle invalid time input
            return
        }

        let newEvent = Activity(
            preview: Image(systemName: selectedIcon),
            title: title,
            startTime: startTime,
            endTime: endTime,
            date: date,
            place: place.isEmpty ? nil : place,
            description: description.isEmpty ? nil : description
        )
        activityManager.addActivity(newEvent)
        dismiss()
    }
}

extension Binding {
    /// Provides a binding to an optional value with a default.
    init(_ source: Binding<Value?>, default defaultValue: Value) {
        self.init(
            get: { source.wrappedValue ?? defaultValue },
            set: { newValue in source.wrappedValue = newValue }
        )
    }
}


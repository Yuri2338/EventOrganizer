//
//  ContentView.swift
//  NavStack
//
//  Created by TumbaDev on 18.07.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var activityManager = ActivityManager()
    @State private var addingEvent = false

    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(activityManager.activities) { event in
                    NavigationLink {
                        List {
                            Section(header: Text("Details")) {
                                Text("Date: \(event.formatDate(event.date))")
                                Text("Place: \(event.place ?? "N/A")")
                                Text("From: \(event.formatTime(event.startTime))")
                                Text("To: \(event.formatTime(event.endTime))")
                            }
                            Section(header: Text("Description")) {
                                Text(event.description ?? "No description provided")
                            }
                        }
                        .navigationTitle(event.title)
                    } label: {
                        HStack {
                            event.preview
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                            VStack(alignment: .leading) {
                                Text(event.title)
                                    .font(.headline)
                                Text("Date: \(event.formatDate(event.date))")
                                    .font(.subheadline)
                                Text("From: \(event.formatTime(event.startTime)) To: \(event.formatTime(event.endTime))")
                                    .font(.subheadline)
                            }
                            Spacer()
                        }
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    .accentColor(.primary)
                }
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        addingEvent.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $addingEvent) {
                AddEventView(activityManager: activityManager)
            }
        }
    }
}


#Preview {
    ContentView()
}

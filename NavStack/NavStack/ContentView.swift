//
//  ContentView.swift
//  NavStack
//
//  Created by TumbaDev on 18.07.24.
//

import SwiftUI

struct Activity: Identifiable {
    let id = UUID()
    
    var preview: Image
    var title: String
    var startTime: Int
    var endTime: Int
    var date: String
    var place: String
    var description: String
    
    func formatTime(_ time: Int) -> String {
        if time > 12 {
            return "\(time - 12) PM"
        } else {
            return "\(time) AM"
        }
    }
    
    func formatDate(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: date){
            dateFormatter.dateStyle = .long
            return dateFormatter.string(from: date)
        } else {
            return date
        }
    }
}

var events: [Activity] = [
    .init(preview: Image(systemName: "cup.and.saucer"), title: "Tea Party", startTime: 18, endTime: 20, date: "2024-08-01", place: "My House", description:
        """
        Silly cat friendly tea party in celebration of my cat's 12 year anniversary. \
        All of his cat friends are invited, his cat girlfriend is no exception. \
        She will tell him the surprise news then. They are having kittens!
        """),
    
    .init(preview: Image(systemName: "sun.max"), title: "Mountain Hike", startTime: 6, endTime: 10, date: "2024-08-02", place: "Vitosha Mountain", description:
        """
        Early morning mountain hike with friends to enjoy the sunrise and the cool breeze. \
        The trail is moderate, suitable for all fitness levels. \
        Don't forget to bring water, snacks, and a camera to capture the stunning views.
        """),

    .init(preview: Image(systemName: "cart"), title: "Grocery Shopping", startTime: 11, endTime: 12, date: "2024-08-03", place: "Local Supermarket", description:
        """
        Quick trip to the grocery store to stock up on fresh produce and essentials. \
        We have a list of ingredients for tonight's dinner and some snacks for the week. \
        Remember to bring reusable bags to reduce plastic waste.
        """),

    .init(preview: Image(systemName: "person.2"), title: "Team Meeting", startTime: 14, endTime: 15, date: "2024-08-04", place: "Online", description:
        """
        Monthly team meeting to discuss project updates and future plans. \
        Each team member will present their progress and any challenges they are facing. \
        There will be a brainstorming session for new ideas and improvements.
        """),

    .init(preview: Image(systemName: "film"), title: "Going to the Movies", startTime: 19, endTime: 21, date: "2024-08-05", place: "Local Theater", description:
        """
        Evening outing to watch the latest blockbuster movie at the local theater. \
        We'll meet in the lobby at 18:45 to buy tickets and snacks. \
        After the movie, there's an option to grab dinner and discuss the film.
        """)
]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(events) { event in
                    NavigationLink {
                        List {
                            Section(header: Text("Details")) {
                                Text("Date: \(event.formatDate(event.date))")
                                Text("Place: \(event.place)")
                                Text("From: \(event.formatTime(event.startTime))")
                                Text("To: \(event.formatTime(event.endTime))")
                            }
                            Section(header: Text("Description")) {
                                Text(event.description)
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
                }
            }
            .navigationTitle("Events")
        }
    }
}

#Preview {
    ContentView()
}

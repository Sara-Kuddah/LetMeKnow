//
// Created for UICalendarView_SwiftUI
// by Stewart Lynch on 2022-06-28
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import Foundation
//
//struct Event: Identifiable {
//    enum EventType: String, Identifiable, CaseIterable {
//        case work, home, social, sport, unspecified
//        var id: String {
//            self.rawValue
//        }
//
//        var icon: String {
//            switch self {
//            case .work:
//                return "🏦"
//            case .home:
//                return "🏡"
//            case .social:
//                return "🎉"
//            case .sport:
//                return "🏟"
//            case .unspecified:
//                return "📌"
//            }
//        }
//    }
//
//    var eventType: EventType
//    var date: Date
//    var note: String
//    var id: String
//
//    init(id: String = UUID().uuidString, eventType: EventType = .unspecified, date: Date, note: String) {
//        self.eventType = eventType
//        self.date = date
//        self.note = note
//        self.id = id
//    }
//
//    // Data to be used in the preview
//    static var sampleEvents: [Event] {
//        return [
//            Event(eventType: .home, date: Date().diff(numDays: 0), note: "Take dog to groomers"),
//            Event(date: Date().diff(numDays: -1), note: "Get gift for Emily"),
//            Event(eventType: .home, date: Date().diff(numDays: 6), note: "File tax returns."),
//            Event(eventType: .social, date: Date().diff(numDays: 2), note: "Dinner party at Dave and Janet's"),
//            Event(eventType: .work, date: Date().diff(numDays: -1), note: "Complete Audit."),
//            Event(eventType: .sport, date: Date().diff(numDays: -3), note: "Football Game"),
//            Event(date: Date().diff(numDays: -4), note: "Plan for winter vacation.")
//        ]
//    }
//}


struct Event: Identifiable {
    enum EventType: String, Identifiable, CaseIterable {
        case user, unspecified
//        work, home, social,
        var id: String {
            self.rawValue
        }

        var icon: String {
            switch self {
//            case .work:
//                return "🏦"
//            case .home:
//                return "🏡"
//            case .social:
//                return "🎉"
            case .user:
                return "📌"
            case .unspecified:
                return "💌"
            }
        }
    }

    var eventType: EventType
    var date: Date
    var note: String
    var id: String
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }

    init(id: String = UUID().uuidString, eventType: EventType = .unspecified, date: Date, note: String) {
        self.eventType = eventType
        self.date = date
        self.note = note
        self.id = id
    }

    // Data to be used in the preview
    static var sampleEvents: [Event] {
        return [
         //   Event(eventType: .home, date: Date().diff(numDays: 0), note: "Take dog to groomers"),
            
//            Event(date: Date().diff(numDays: -1), note: "Get gift for Emily"),
//            Event(eventType: .home, date: Date().diff(numDays: 6), note: "File tax returns."),
//            Event(eventType: .social, date: Date().diff(numDays: 2), note: "Dinner party at Dave and Janet's"),
            
//            Event(eventType: .work, date: Date().diff(numDays: -1), note: "Complete Audit."),
//            Event(eventType: .work, date: Date().diff(numDays: 0), note: "World Vegan Day."), //1NOV
//            Event(eventType: .sport, date: Date().diff(numDays: -3), note: "Football Game"),
            
            Event(date: Date().diff(numDays: -20), note: "Breast Cancer Awareness."),//13OCT
            Event(date: Date().diff(numDays: 0), note: "World Vegan Day."),//1NOV
            Event(date: Date().diff(numDays: -3), note: "Football Game."),
            Event(date: Date().diff(numDays: -4), note: "Plan for winter vacation."),
            Event(date: Date().diff(numDays: -2), note: "Plan for winter ."),
            Event(date: Date().diff(numDays: 19), note: "Universal Children's Day ."),//20NOV
            Event(date: Date().diff(numDays: 20), note: "FIFA World Cup 2022 ."),
            Event(date: Date().diff(numDays: 24), note: "Black Friday ."),//25Nov
            
            
//            Event(date: Date().diff(numDays: 2), note: "my bd ."),
            Event(eventType: .user, date: Date().diff(numDays: 2), note: "Football "),
            
            
        ]
    }
}

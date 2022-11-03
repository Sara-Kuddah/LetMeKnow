//
// Created for UICalendarView_SwiftUI
// by Stewart Lynch on 2022-06-28
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

//struct EventsCalendarView: View {
//    @EnvironmentObject var eventStore: EventStore
//    @State private var dateSelected: DateComponents?
//    @State private var displayEvent = false
//    @State private var formType: EventFormType?
//    var body: some View {
//        NavigationStack {
//            ScrollView{
//                CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture),
//                             eventStore: eventStore,
//                             dateSelected: $dateSelected,
//                             displayEvent: $displayEvent)
//            }
//            .sheet(item: $formType) { $0 }
//                        .sheet(isPresented: $displayEvents) {
//                            DaysEventsListView(dateSelected: $dateSelected)
//                                .presentationDetents([.medium, .large])
//                        }
//                .navigationTitle("Calendar View")
//        }
//    }
//}
//
//struct EventsCalendarView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventsCalendarView()
//            .environmentObject(EventStore(preview: true))
//    }
//}



struct EventsCalendarView: View {
    @EnvironmentObject var eventStore: EventStore
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false
    @State private var formType: EventFormType?
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
         //   ScrollView {
                CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture),
                             eventStore: eventStore,
                             dateSelected: $dateSelected,
                             displayEvents: $displayEvents)
             //   .padding(.top, -6.0)
              
           // }
            .navigationTitle("Calendar View")
         //   .padding(-37.0)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        formType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.medium)
                    }
                }
            }

            VStack() {
            Capsule().fill(Color.blue.opacity(0.8)).frame(width: 350, height: 4)
            }
            
            ScrollView{
                VStack{
                    if let dateSelected {
                        let foundEvents = eventStore.events
                            .filter {$0.date.startOfDay == dateSelected.date!.startOfDay}
                        ForEach(foundEvents) { event in
                            ListViewRow(event: event, formType: $formType)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        eventStore.delete(event)
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                }
                                .sheet(item: $formType) { $0 }
                                .frame(width: 340)
                            
                            
                            
//                            Button {isPresented.toggle()}
//                        label: {
//                                Text("More Info")
//                            }
//                            .buttonStyle(.bordered)
//                            // .padding()
                            
                        }
                        // .navigationTitle("Calendar View")
                    }
                }
            }
   //       .sheet(item: $formType) { $0 }
            
//            .sheet(isPresented: $displayEvents) {
//                DaysEventsListView(dateSelected: $dateSelected)
//                    .presentationDetents([.medium, .large])
//            }
            
            
//            .navigationTitle("Calendar View")
//            .padding()
            
//            if displayEvents {
//
//                DaysEventsListView(dateSelected: $dateSelected)
//
//                    .frame(width: 400.0, height: 200.0)
//            }
              

//            var noEvent: Int?
//            print(noEvent ?? NoEvent)
            
        }
       // .padding(.top, 0.0)
      //  .padding(-18.0)
    }
}

struct EventsCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        EventsCalendarView()
            .environmentObject(EventStore(preview: true))
    }
}

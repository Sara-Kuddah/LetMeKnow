//
// Created for UICalendarView_SwiftUI
// by Stewart Lynch on 2022-06-29
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

//import SwiftUI
//
//struct EventFormView: View {
//    @EnvironmentObject var eventStore: EventStore
//    @StateObject var viewModel: EventFormViewModel
//    @Environment(\.dismiss) var dismiss
//    @FocusState private var focus: Bool?
//    @State var EventName = ""
//    @State var Notes = ""
//    @State var title = "Remind Me"
//    @State private var Expand = false
//    var body: some View {
//        NavigationStack {
//            VStack {
//                Form {
//                    TextField("Event Name", text: $EventName)
//                    DatePicker(selection: $viewModel.date) {
//                        Text("Event At")
//                    }
//                    HStack{
//                        Text(title)
//                        Image(systemName: Expand ? "chevron.up": "chevron.down")
//                    }.onTapGesture {
//                        self.Expand.toggle()
//                    }
//                    if Expand {
//                        Button(action:{
//                            print("day before")
//                            title = "day before"
//                            self.Expand.toggle()
//                        }){
//                        }
//                        Text("day before")
//                            .padding()
//                            .foregroundColor(.gray)
//                    }
////                    Button(action:{  ساره رجعي البتم و كملي الله يسعده
////                        print("Week before")
////                        title = "Week before"
////                        self.Expand.toggle()
////                    })
//                    {
//                        Text("Week before")
//                            .padding()
//                            .foregroundColor(.gray)
//                    }
//                    Button(action:{
//                        print("Month before")
//                        title = "Moth before"
//                        self.Expand.toggle()
//                    }){
//                        Text("Month before")
//                            .padding()
//                            //ساره في بادينق مسحناه
//                    }
//                    TextField("Note", text: $viewModel.note, axis: .vertical)
//                        .focused($focus, equals: true)
//                    Picker("Event Type", selection: $viewModel.eventType) {
//                        ForEach(Event.EventType.allCases) {eventType in
//                            Text(eventType.icon + " " + eventType.rawValue.capitalized)
//                                .tag(eventType)
//                        }
//                    }
//                    Section(footer:
//                                HStack {
//                        Spacer()
//                        Button {
//                            if viewModel.updating {
//                                // update this event
//                                let event = Event(id: viewModel.id!,
//                                                  eventType: viewModel.eventType,
//                                                  date: viewModel.date,
//                                                  note: viewModel.note)
//                                eventStore.update(event)
//                            } else {
//                                // create new event
//                                let newEvent = Event(eventType: viewModel.eventType,
//                                                     date: viewModel.date,
//                                                     note: viewModel.note)
//                                eventStore.add(newEvent)
//                            }
//                            dismiss()
//                        } label: {
//                            Text(viewModel.updating ? "Update Event" : "Add Event")
//                        }
//                        .buttonStyle(.borderedProminent)
//                        .disabled(viewModel.incomplete)
//                        Spacer()
//                    }
//                    ) {
//                        EmptyView()
//                    }
//                }
//            }
//            .navigationTitle("Add Your Event")
//            .onAppear {
//                focus = true
//            }
//        }
//    }
//}
//
//struct EventFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventFormView(viewModel: EventFormViewModel())
//            .environmentObject(EventStore())
//    }
//}


import SwiftUI

struct EventFormView: View {
    @EnvironmentObject var eventStore: EventStore
    @StateObject var viewModel: EventFormViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var focus: Bool?
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    DatePicker(selection: $viewModel.date) {
                        Text("Date and Time")
                    }
                    TextField("Note", text: $viewModel.note, axis: .vertical)
                        .focused($focus, equals: true)
                    Picker("Event Type", selection: $viewModel.eventType) {
                        ForEach(Event.EventType.allCases) {eventType in
                            Text(eventType.icon + " " + eventType.rawValue.capitalized)
                                .tag(eventType)
                        }
                    }
                    Section(footer:
                                HStack {
                        Spacer()
                        Button {
                            if viewModel.updating {
                                // update this event
                                let event = Event(id: viewModel.id!,
                                                  eventType: viewModel.eventType,
                                                  date: viewModel.date,
                                                  note: viewModel.note)
                                eventStore.update(event)
                            } else {
                                // create new event
                                let newEvent = Event(eventType: viewModel.eventType,
                                                     date: viewModel.date,
                                                     note: viewModel.note)
                                eventStore.add(newEvent)
                            }
                            dismiss()
                        } label: {
                            Text(viewModel.updating ? "Update Event" : "Add Event")
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(viewModel.incomplete)
                        Spacer()
                    }
                    ) {
                        EmptyView()
                    }
                }
            }
            .navigationTitle(viewModel.updating ? "Update" : "New Event")
            .onAppear {
                focus = true
            }
        }
    }
}

struct EventFormView_Previews: PreviewProvider {
    static var previews: some View {
        EventFormView(viewModel: EventFormViewModel())
            .environmentObject(EventStore())
    }
}

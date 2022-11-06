//
// Created for UICalendarView_SwiftUI
// by Stewart Lynch on 2022-06-29
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct ListViewRow: View {
    let event: Event
    @Binding var formType: EventFormType?
    @State var navigated = false
    
    @StateObject var myEvents = EventStore(preview: true)
    @State private var action: Int? = 0
    
    @State var editIsShow = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: RiyadhSeason(), tag: 1, selection: $action) {
                    Card(event: event, formType: $formType)
                }
//                NavigationLink(destination: RiyadhSeason(), tag: 2, selection: $action) {
//                    Card(event: event, formType: $formType)
//                }
                
//                Text("Your Custom View 1")
                    .onTapGesture {
                        //perform some tasks if needed before opening Destination view
                        self.action = 1
                    }
//                Text("Your Custom View 2")
//                    .onTapGesture {
//                        //perform some tasks if needed before opening Destination view
//                        self.action = 2
//                    }
            }
        }.padding(.top, -120)
        //=======
        
        
        
    }
    
    
    struct ListViewRow_Previews: PreviewProvider {
        static let event = Event(eventType: .user, date: Date(), note: "Let's party")
        static var previews: some View {
            ListViewRow(event: event, formType: .constant(.new))
        }
    }
    
}

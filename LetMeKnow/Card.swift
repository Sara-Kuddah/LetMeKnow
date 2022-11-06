//
//  Card.swift
//  LetMeKnow
//
//  Created by Sara Khalid BIN kuddah on 11/04/1444 AH.
//

import SwiftUI

struct Card: View {
    let event: Event
    @Binding var formType: EventFormType?
    @State var navigated = false
    
    @StateObject var myEvents = EventStore(preview: true)
    @State var editIsShow = false
    var body: some View {
        VStack{
            
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(event.eventType.icon)
                            .font(.system(size: 40))
                        
                        Text(event.note)
                            .foregroundColor(.black)
                    }
                    Text(
                        event.date.formatted(date: .abbreviated,
                                             time: .shortened)
                    ).foregroundColor(.black)
                    
                }.padding(.all)
                    .padding(.top, -10)
                Spacer()
                //navigationTitle("clicle me", destination: RiyadhSeason())
                //                    NavigationLink(destination: RiyadhSeason(), tag: 1, selection: $action) {
                //                        EmptyView()
                //                    }
                if editIsShow{
                    Button {
                        // if 1- edet , more info
                        //            action: do { self.navigated.toggle() }
                        if editIsShow {
                            formType = .update(event)
                            
                            
                        }else{
                            
                            
                            //                                NavigationLink(destination: RiyadhSeason()){
                            //                                    Text("Hi")
                            //                                }
                            
                            
                            //                   // RiyadhSeason()
                            //                    NavigationLink("AddCreditCardView", destination: RiyadhSeason(), isActive: $navigated)
                            ////                    RiyadhSeason()
                            ////                        .environmentObject(myEvents)
                            //
                            //
                            //
                        }
                        
                    } label: {
                        
                        Text(editIsShow ? "Edit" : "more Info")
                        
                        //Text("edit")
                    }
                    .buttonStyle(.bordered)
                }}.onAppear{
                    ShowEditBtn ()
                }
            
        }.padding()
    }

    func ShowEditBtn ()
    {
        if event.eventType == .user
        {  editIsShow = true
        }
        else
        {
            editIsShow = false
        }
        
    }
    }



struct Card_Previews: PreviewProvider {
    static let event = Event(eventType: .user, date: Date(), note: "Let's party")
    static var previews: some View {
        Card(event: event, formType: .constant(.new))
    }
}


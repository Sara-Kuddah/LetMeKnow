//
//  ContentView.swift
//  Riyadhseason
//
//  Created by Norah Abass AlOtaibi on 29/03/1444 AH.
//

import SwiftUI
struct RiyadhSeason: View {
    
     func openMap(Address:String){
        UIApplication.shared.openURL(NSURL(string: "http://maps.apple.com/?address=\(Address)")! as URL)
    }

    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("Colore"),Color("Colort")]),
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea(.all)
                
                VStack {
                    
                    
                    NavigationLink ("", destination: EventsCalendarView()
                    )
                    
                    .foregroundColor(.white)
                    .padding(.leading,-159)
                    .padding(.bottom)
                    .padding(.top,100)
                    
                    
                    
                    
                    Image("S1")
                        .resizable()
                        .padding(0.0)
                        .scaledToFit()
                        .frame(width: 300, height: 200, alignment: .top)
                        .cornerRadius(30)
                        .edgesIgnoringSafeArea(.top)
                        .padding(.bottom,20)
                        .padding(.top)
                    
                    Text("About Event")
                        .font(.title)
                        .foregroundColor(Color(red: 1.002, green: 0.947, blue: -0.013))
                        .multilineTextAlignment(.center)

                    
                    Text( "Riyadh hosts Winter Wonderland, the biggest theme park in its third season, combining rides & adventures in a unique experience for all ages. More than 80 different experiences including thrill, family, kids rides, and different characters & musical shows.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.all,30)

                    
                    
                    Label {
                        Text("Winter Wonderland")
                            .foregroundColor(Color(red: 0.963, green: 0.904, blue: 0.29))
                    } icon: {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(Color.orange)
                    }
                    
                    Label {
                        Text("weekdays")
                            .foregroundColor(Color(red: 0.964, green: 0.9, blue: 0.292))
                    } icon: {
                        Image(systemName: "clock")
                            .foregroundColor(Color.orange)
                    }
                    
                    
                    Label {
                        Text("22 Oct To 22 Dec")
                            .foregroundColor(Color(hue: 0.152, saturation: 0.702, brightness: 0.939))
                    } icon: {
                        Image(systemName: "calendar")
                        .foregroundColor(Color.orange)}
                    
                    
                    
                   
                    Button(action:{
                        openMap(Address: "24.768489021304667,46.6449753288363")
                    }) {
                        Text("Location")
                            .font(.system(size: 24, weight: .semibold, design: .serif))
                            .foregroundColor(Color.blue).font(
                                .system(size:30)).background(Color.yellow)
                            .underline()
                        
                        
                    }.padding(.all)
                    
                }.padding(.top,-150)
            }
            
            
            
        }
        
     
        
       
        
        
       // func openMap(Address:String){
                  //  UIApplication.shared.openURL(NSURL(string: //"http://maps.apple.com/?address=\(Address)")! as URL)
                }
        
    }
    
    
    struct RiyadhSeason_Previews: PreviewProvider {
        static var previews: some View {
            RiyadhSeason()
        }
    }
    


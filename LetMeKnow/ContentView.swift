//
//  ContentView.swift
//  LetMeKnow
//
//  Created by Sara Khalid BIN kuddah on 08/04/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var launchScreenManager: LunchScreenManager
    var body: some View {
        VStack{
            Button("Tap Me!"){
                print("I have been tapped")
            }
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .onAppear{
                    DispatchQueue
                        .main.asyncAfter(deadline: .now() + 5){
                            launchScreenManager.dismiss()
                        }
                }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LunchScreenManager())
    }
}

//
//  LetMeKnowApp.swift
//  LetMeKnow
//
//  Created by Sara Khalid BIN kuddah on 06/04/1444 AH.
//

import SwiftUI

@main
struct LetMeKnowApp: App {
    @StateObject var launchScreenManager = LunchScreenManager()
    var body: some Scene {
        WindowGroup {
            ZStack{
                ContentView()
                
                if launchScreenManager.state != .complated{
                    LaunchScreenView()
                }
                
            }
            .environmentObject(launchScreenManager)
        }
    }
}

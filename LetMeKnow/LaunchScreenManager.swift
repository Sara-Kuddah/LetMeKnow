//
//  LaunchScreenManager.swift
//  LetMeKnow
//
//  Created by Sara Khalid BIN kuddah on 08/04/1444 AH.
//

import Foundation

enum LaunchScreenPhase{
    case first
    case second
    case complated
}
final class LunchScreenManager: ObservableObject {
    @Published private(set) var state: LaunchScreenPhase = .first
    
    func dismiss(){
        self.state = .second
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.state = .complated
        }
    }
}

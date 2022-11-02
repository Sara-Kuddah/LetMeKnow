//
//  ContentView.swift
//  LetMeKnow
//
//  Created by Sara Khalid BIN kuddah on 06/04/1444 AH.
//

import SwiftUI
import UIKit

struct LaunchScreenView: View {
    //    init() {
    //        UITableViewCell.appearance().backgroundColor = UIColor.clear
    //        UITableView.appearance().backgroundColor = .clear
    //    }
    @EnvironmentObject var launchScreenManager: LunchScreenManager
    @State private var firstPhaseIsAnimating: Bool = false
    @State private var secondPhaseIsAnimating: Bool = false
    
    
    private let timer = Timer.publish(every: 0.65, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            background
            logo
            //            LinearGradient(gradient: Gradient(colors: [Color("Colore"),Color("Colort")]),
            //                           startPoint: .top,
            //                           endPoint: .bottom)
            //            .ignoresSafeArea(.all)
            
            //            VStack {
            //
            //                GifImage("elogoGif")
            //                    .frame(width: 300, height: 330)
            //                    .clipShape(Circle())
            //                    .overlay(Circle()
            //
            //                        .foregroundColor(Color("Colort")).opacity(0.5))
            //                    .padding(.top,-200)
            //                    .padding(.bottom,100)
            //
            //
            //
            //
            //
            //                Text("Let Me Know")
            //                    .font(.custom("Georgia", size: 40, relativeTo: .headline))
            //
            //                    .bold()
            //                    .foregroundColor(.white)
            //
            //
            //
            //
            //
            //            }.padding(.bottom,-100)
            
        }.onReceive(timer){
            input in
            switch launchScreenManager.state{
            case .first:
                withAnimation(.spring()){
                    firstPhaseIsAnimating.toggle()
                    
                }
            case .second:
                withAnimation(.spring()){
                    secondPhaseIsAnimating.toggle()
                }
            default: break
            }
        }
        .opacity(secondPhaseIsAnimating ? 0 : 1)
    }
}
    
    struct LaunchScreenView_Previews: PreviewProvider {
        static var previews: some View {
            LaunchScreenView()
                .environmentObject(LunchScreenManager())
        }
    }
    private extension LaunchScreenView{
        var background: some View{
            Color("launch-screen-backgroud")
        }
        var logo:some View{
            Image("LMKlogo")
                .scaleEffect(firstPhaseIsAnimating ? 0.6 : 1)
                .scaleEffect(secondPhaseIsAnimating ? UIScreen.main.bounds.size.height / 4 : 1)
        }
    }


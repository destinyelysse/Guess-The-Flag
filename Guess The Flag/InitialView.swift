//  InitialView.swift
//  Guess The Flag
//
//  Created by Destiny Serna on 10/27/20.

import SwiftUI

struct InitialView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                NavigationLink("Start Game!", destination: GameView())
                    .foregroundColor(.white)
                    .padding()
                    .font(.largeTitle)
            }
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}

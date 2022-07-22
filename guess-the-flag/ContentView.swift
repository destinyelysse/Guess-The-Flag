//
//  ContentView.swift
//  guess-the-flag
//
//  Created by Destiny Serna on 7/18/22.
//

import SwiftUI

struct ContentView: View {
    
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            Color(hue: 0.65, saturation: 0.53, brightness: 1.0, opacity: 1.0).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                }
                ForEach(0 ..< 3){ number in
                    Button(action: {
                        // flag tapped
                    }){
                        Image(self.countries[number])
                            .renderingMode(.original)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

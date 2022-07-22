//
//  ContentView.swift
//  guess-the-flag
//
//  Created by Destiny Serna on 7/18/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingResults = false
    
    @State private var resultsTitle = ""
    
    @State private var resultsMessage = ""
    
    @State private var currentScore = 0
    
    var body: some View {
        
        ZStack{
            Color(hue: 0.65, saturation: 0.53, brightness: 1.0, opacity: 1.0).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                Spacer()
                VStack(spacing: 10) {
                    Text("Tap the flag of").foregroundColor(.white)
                    Text(countries[correctAnswer]).foregroundColor(.white).font(.largeTitle).fontWeight(.black)
                }
                ForEach(0 ..< 3){ number in
                    Button(action: {
                        self.flagTapped(number)
                    }){
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                            .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                Text("Score: \(currentScore)").foregroundColor(.white)
                Spacer()
                Spacer()
            }
        }.alert(isPresented: $showingResults){
            Alert(title: Text(resultsTitle),
                  message: Text(resultsMessage),
                  dismissButton: .default(Text("Play again")){
                self.resetRound()
            })
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            currentScore += 1
            resultsTitle = "Correct!"
            resultsMessage = "Your score is \(currentScore)."
        } else {
            resultsTitle = "Incorrect..."
            resultsMessage = "You selected the country of \(countries[number])"
        }
        showingResults = true
    }
    
    func resetRound() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

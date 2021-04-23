//  ContentView.swift
//  Guess The Flag
//
//  Created by Destiny Serna on 10/27/20.

import SwiftUI

struct GameView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["estonia", "france", "germany", "ireland", "italy", "nigeria", "poland", "russia", "spain", "uk", "us"]
    @State private var score = 0
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                Text("Guess the flag of...")
                    .padding()
                    .foregroundColor(.white)
                Text(countries[correctAnswer].uppercased())
                    .padding()
                    .foregroundColor(.white)
                    .font(.largeTitle)
                VStack {
                    ForEach(0..<3) { number in
                        Button(action: {
                            self.flagTapped(number)
                        }) {
                            Image(self.countries[number])
                                .renderingMode(.original)
                        }
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 1))
                        .shadow(color: .black, radius: 3)
                    }
                    Spacer()
                }
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                    self.startNewRound()
                })
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct!"
        } else {
            score -= 1
            scoreTitle = "Incorrect"
        }
        
        showingScore = true
    }
    
    func startNewRound() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

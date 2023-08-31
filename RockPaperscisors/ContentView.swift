//
//  ContentView.swift
//  RockPaperscisors
//
//  Created by Chuck Belcher on 8/30/23.
//

import SwiftUI

struct ContentView: View {
    var moves = ["👊", "✋", "✌️"]
    @State private var computerChoice = Int.random(in: 0..<3)
    @State private var score = 0
    @State private var shouldWin = Bool.random()
    @State private var questionNumber = 0
    @State private var showingGameOverAlert = false
    
    var body: some View {
        VStack {
            Text("Rock Paper Scissors")
                .font(.title)
            Text("Brain Teazer")
                .font(.title2)
                .padding(.bottom, 30)
            //Display Computer Choice
            Text("Computer Choice")
                .font(.headline)
                .foregroundColor(.blue)
            Text(moves[computerChoice])
                .font(.system(size: 200))
            if shouldWin {
                Text("Which choice wins")
                    .foregroundColor(.green)
                    .font(.headline)
            } else {
                Text("Which choice would loose")
                    .foregroundColor(.red)
                    .font(.headline)
            }
            HStack {
                ForEach((0...2), id: \.self) { option in
                    Button {
                        playRound(choice: option)
                    } label: {
                        Text(moves[option])
                            .font(.system(size: 100))
                            .padding(.top, 30)
                    }
                }
            }
            
            Text("Score \(score)")
                .font(.title)
                .padding(.top, 30)
        }
        .padding()
        .alert("Reset Game", isPresented: $showingGameOverAlert) {
            Button {
                reset()
            } label: {
                Text("Reset Game")
            }

        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    func reset() {
        print("Resetting Game")
        questionNumber = 0
        score = 0
        computerChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
    
    func playRound(choice: Int) {
        let winningOptions = [1, 2, 0]
        let loosingOptions = [2, 0, 1]
        var didWin = false
        var didLoose = false
        if choice  == winningOptions[computerChoice] {
            didWin = true
        } else if choice == loosingOptions[computerChoice] {
            didLoose = true
        }
        
        //Check to see if we should have won
        if shouldWin == true && didWin == true {
            score += 1
        } else if shouldWin == false && didLoose == true {
            score += 1
        } else {
            score -= 1
        }
        computerChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
        questionNumber += 1
        
        if questionNumber == 10 {
            print("Game Over")
            showingGameOverAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

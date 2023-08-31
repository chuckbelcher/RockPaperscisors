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
                        print("selected option \(option)")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

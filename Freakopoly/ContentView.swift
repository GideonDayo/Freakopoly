//
//  ContentView.swift
//  Freakopoly
//
//  Created by Gideon Dayo on 11/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var p1Name = "Player 1"
    @State private var p1Pos = 0
    @State private var p1Money = 1500
    //hi owen hi gang
    
    @State private var p2Name = "Player 2"
    @State private var p2Pos = 0
    @State private var p2Money = 1500
    
    @State private var turn = 1 // make  alt turns
    @State private var dice = 0
    @State private var gameEnded = false
    @State private var message = ""
    
    let boardPlaces = [
        "Go", "Grand Glacier", "Rebels Roost", "Mount Olympus",
        "Fanum Tax", "Greasy Grove", "Coney Crossroads", "Frenzy Farm",
        "Creeky Compound", "Pleasant Piazza", "Diddys Mansion", "Lavish Lair",
        "Electric Company", "Shipwreck Shallows", "Fencing Fields", "Ruined Reels",
        "Chiraq", "Community Chest", "O-Block", "NYC Trenches"
    ]
    
    let treasureCards = ["Giant boulder found"] //ADD DESCRIPTIONS
    
    
    var body: some View {
        VStack {
            Text("Fortnite Freakopoly")
                .font(.largeTitle)
                .bold()
            
            if !gameEnded {
                let currentPlayerName = turn == 1 ? p1Name : p2Name
                Text("Turn: \(currentPlayerName)")
                Text("Dice Roll: \(dice)")
                Text(message)
                
                
                Button("Roll Dice") {
                    roll()
                }
                .padding()  .background(Color.green)  .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            else {
                Text(message)
                    .font(.title)
                    .foregroundColor(.red)
            }
            
            Text("\(p1Name) --- Position: \(boardPlaces[p1Pos]) --- Money: $\(p1Money)")
            Text("\(p2Name) --- Position: \(boardPlaces[p2Pos]) --- Money: $\(p2Money)")
                .padding()
        }
        .padding()
    }
    
    func roll() {
        dice = Int.random(in: 2...12)
        
        if turn == 1 {
            p1Pos = (p1Pos + dice) % boardPlaces.count
            message = "\(p1Name) moved to \(boardPlaces[p1Pos])"
            if p1Pos == 0 {
                p1Money += 200
                message += " and received $200 for passing Go!"
            }
            
            
            
            
            if p1Money <= 0 {
                gameEnded = true
                message = "\(p1Name) is out of money! Game over."
            }
        } else {
            
            
            
            
            
            p2Pos = (p2Pos + dice) % boardPlaces.count
            
            message = "\(p2Name) moved to \(boardPlaces[p2Pos])"
         
            
            
            if p2Pos == 0 {
                
                p2Money += 200
                message += "  received $200 for passing Go"
            }
            
            if p2Money <= 0 {
                gameEnded = true
                message = "\(p2Name) is out of money, Bankrupt brokie"
                
               
                Button("Bankrupt") {
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
            }
        }
        
        
        if turn == 1 {
            turn = 2
        } else {
            turn = 1
        }
    }
}




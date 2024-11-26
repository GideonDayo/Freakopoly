//
//  ContentView.swift
//  Freakopoly
//
//  Created by Gideon Dayo on 11/8/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct Setting: Identifiable {
    let id = UUID()
    var name: String
    var isContacted = false
}

struct ContentView: View {
    @State private var startingCash: Int = 1500
    //player 1 data
    @State private var p1Name = "Player 1"
    @State private var p1Pos = 0
    @State private var p1Money = 1500
    //player 2 data
    @State private var p2Name = "Player 2"
    @State private var p2Pos = 0
    @State private var p2Money = 1500
    //game data
    @State private var roll1 = 0
    @State private var roll2 = 0
    @State private var turn = 1 // make  alt turns
    @State private var dice = 0
    @State private var gameEnded = false
    @State private var message = "" //displayed message
    
    //sidebar
    @State private var isSidebarVisible = false
    @State private var isDarkMode = false
    @State private var isNotificationsEnabled = true
    @State private var isLocationAccessGranted = false
       
    let boardPlaces: [String] = [
        "Go", "Grand Glacier", "Rebels Roost", "Mount Olympus",
        "Fanum Tax", "Greasy Grove", "Coney Crossroads", "Frenzy Farm",
        "Creeky Compound", "Pleasant Piazza", "Diddys Mansion", "Lavish Lair",
        "Electric Company", "Shipwreck Shallows", "Fencing Fields", "Ruined Reels",
        "Chiraq", "Community Chest", "O-Block", "NYC Trenches"
    ]
    
    let treasureCards: [String] = ["Giant boulder found"] //ADD DESCRIPTIONS
    
    @State private var settings: [Setting] = [ //settings
            Setting(name: "Even Build"),
            Setting(name: "Rent in Jail"),
            Setting(name: "Mortgaging"),
            Setting(name: "Vacation Cash"),
            Setting(name: "Auction")
        ]
    
    var body: some View {
        HStack{
            ZStack{ //Sidebar button
                Button(action: {
                    // Toggle Sidebar visibility
                    withAnimation {
                        isSidebarVisible.toggle()
                    }
                }) {
                    Text(isSidebarVisible ? "Hide Sidebar" : "Show Sidebar") //This is the text for the sidebar view
                        .font(.title)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                if isSidebarVisible {
                    SidebarView(isSidebarVisible: $isSidebarVisible, isDarkMode: $isDarkMode, isNotificationsEnabled: $isNotificationsEnabled, isLocationAccessGranted: $isLocationAccessGranted, settings: $settings)
                        .transition(.move(edge: .leading)) // Slide-in transition
                        .zIndex(1) // Bring sidebar in front of main content
                }
            }
            VStack{
                HStack{
                    
                    Text("Enter Cash Amount:")
                    TextField("Enter Starting Cash:", value: $startingCash, format: .number)
                        .onSubmit{
                            if(startingCash>3000){
                                startingCash = 3000
                            }
                            if(startingCash<1000){
                                startingCash = 1000
                            }
                            p1Money = startingCash
                            p2Money = startingCash
                        }
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
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
                    
                    Text("\(p1Name), Position: \(boardPlaces[p1Pos]), Money: $\(p1Money)")
                    Text("\(p2Name), Position: \(boardPlaces[p2Pos]), Money: $\(p2Money)")
                        .padding()
                    Button(action: {
                        gameEnded = true
                        if(turn == 1){
                            message = "\(p1Name) is out of money! Game over."
                        } else {
                            message = "\(p2Name) is out of money! Game over."
                        }
                        
                        //remove this later
//                        let db = Firestore.firestore()
                        //                db.collection("Test").document("1").setData(["name": "Hello, World!"])
                        
//                        db.collection("UserData").document("4").setData(["name": "Hello, World!"])
                        
                        print("hi")
                        
                    }, label: {
                        ZStack{
                            Text("Fibonacci")
                                .foregroundStyle(.white)
                        }
                    })
                    .padding()  .background(Color.red)  .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
            }
        }
    }
    func roll() {
        roll1 = Int.random(in: 1...6)
        roll2 = Int.random(in: 1...6)
        dice = roll1+roll2
        //fixed false logic 2-12 != 1-6 + 1-6, also we need to be able to detect similar numbers between die
        
        if turn == 1 {
            p1Pos = (p1Pos + dice) % boardPlaces.count
            if(roll1 == roll2){
                message = "\(p1Name) moved to \(boardPlaces[p1Pos]). \(p1Name) has rolled a double, roll again"
            }else{
                message = "\(p1Name) moved to \(boardPlaces[p1Pos])"
            }
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
            
            if(roll1 == roll2){
                message = "\(p2Name) moved to \(boardPlaces[p2Pos]). \(p2Name) has rolled a double, roll again."
            } else {
                message = "\(p2Name) moved to \(boardPlaces[p2Pos])"
            }
            
            
            if p2Pos == 0 { //needs fixed logic
                
                p2Money += 200
                message += "\(p2Name)  received $200 for passing Go"
            }
            
            if p2Money <= 0 {
                gameEnded = true
                message = "\(p2Name) is out of money, Bankrupt brokie"
                
               
               
                
            }
        }
        
        
        if turn == 1 && roll1 != roll2{
            turn = 2
        } else if turn == 2 && roll1 != roll2{
            turn = 1
        }
    }
}
struct SidebarView: View {
    // Binding values from parent view
    @Binding var isSidebarVisible: Bool
    @Binding var isDarkMode: Bool
    @Binding var isNotificationsEnabled: Bool
    @Binding var isLocationAccessGranted: Bool
    @Binding var settings: [Setting]
    
    var body: some View {
        VStack {
            // Close button to hide sidebar
            Button(action: {
                withAnimation {
                    isSidebarVisible = false
                }
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
            }
            Text("Settings")
                .font(.system(size:40))
                .underline()
            // Settings Section with Toggles
            Form {
                List($settings) { $setting in
                    HStack{
                        Text(setting.name)
                        Toggle("Setting has been Changed", isOn: $setting.isContacted)
                            .labelsHidden()
                    }
                }
            }
            .frame(maxWidth: 300, maxHeight: 500)
            .background(Color.gray.opacity(0.8))
            .cornerRadius(10)
            .padding()
        }
        .frame(width: 300)
        .background(Color.gray)
        .cornerRadius(10)
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.vertical)
    }
}

#Preview{
    ContentView()
}


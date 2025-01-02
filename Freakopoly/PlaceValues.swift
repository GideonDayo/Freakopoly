//
//  PlaceValues.swift
//  Freakopoly
//
//  Created by Owen Fahringer on 12/5/24.
//

import SwiftUI

class Properties: Identifiable, ObservableObject { //Should possibly use observable object not really sure
    @StateObject var gm: GameManager = GameManager()
    
    @Published var id = UUID()
    @Published var name: String = ""
    @Published var cost: Int = 0
    @Published var rentValues: [Int] = []
    @Published var mortgageValue: Int = 0
    @Published var houseCount: Int = 0
    @Published var houseCost: Int = 50
    @Published var owned: Bool = false
    @Published var ownedBy: Int = 0
    @Published var location: Int = 0
    @Published var group: Int = 0
    
    init(name:String, cost:Int, rentValues:[Int], houseCount:Int, houseCost: Int, owned: Bool, ownedBy: Int, location: Int, group: Int){
            self.name = name
            self.cost = cost
            self.rentValues = rentValues
            mortgageValue = cost/2
            self.houseCount = houseCount
            self.houseCost = houseCost
            self.owned = owned
            self.ownedBy = ownedBy
            self.location = location
            self.group = group
            
    }
    init(name:String, location:Int, group: Int){
        self.name = name
        self.location = location
        self.group = group
        
    }
    init(){
        self.monopolyProperties = [
            
        ]
    }
    @Published var monopolyProperties = [ //Special properties: Go: 0 | Com chests at loc: 2,17,33 | Chance cards at loc: 7, 22, 36 | Luxury tax loc: 38 | Income tax loc: 4 | Jail & go to jail loc: 10,30 | Vacation loc: 20
        
        //Go
        Properties(name: "Go", location: 0, group: 15),
        // Brown property 1 group 0
        Properties(name: "Mediterranean Avenue", cost: 60, rentValues: [2, 10, 30, 90, 160, 250], houseCount: 0, houseCost: 50, owned: false, ownedBy: 0, location: 1, group: 0),
        //Community chest
        Properties(name: "Community Chest", location: 2, group: 10),
        // Brown property 2 group 0
        Properties(name: "Baltic Avenue", cost: 60, rentValues: [4, 20, 60, 180, 320, 450], houseCount: 0, houseCost: 50, owned: false, ownedBy: 0, location: 3, group: 0),
        //Income tax 10%
        Properties(name: "Income Tax", location: 4, group: 16),
        // Railroad 1 group 8
        Properties(name: "Reading Railroad", cost: 200, rentValues: [25, 50, 100, 200], houseCount: 0, houseCost: 0, owned: false, ownedBy: 0, location: 5, group: 8),
        // Light Blue property group 1
        Properties(name: "Oriental Avenue", cost: 100, rentValues: [6, 30, 90, 270, 400, 550], houseCount: 0, houseCost: 50, owned: false, ownedBy: 0, location: 6, group: 1),
        //Chance card 1 group 11
        
        //Light Blue properties 2&3 group 1
        Properties(name: "Vermont Avenue", cost: 100, rentValues: [6, 30, 90, 270, 400, 550], houseCount: 0, houseCost: 50, owned: false, ownedBy: 0, location: 8, group: 1),
        Properties(name: "Connecticut Avenue", cost: 120, rentValues: [8, 40, 100, 300, 450, 600], houseCount: 0, houseCost: 50, owned: false, ownedBy: 0, location: 9, group: 1),
        
        // Pink properties group 2
        Properties(name: "St. Charles Place", cost: 140, rentValues: [10, 50, 150, 450, 625, 750], houseCount: 0, houseCost: 100, owned: false, ownedBy: 0, location: 11, group: 2),
        Properties(name: "States Avenue", cost: 140, rentValues: [10, 50, 150, 450, 625, 750], houseCount: 0, houseCost: 100, owned: false, ownedBy: 0, location: 13, group: 2),
        Properties(name: "Virginia Avenue", cost: 160, rentValues: [12, 60, 180, 500, 700, 900], houseCount: 0, houseCost: 100, owned: false, ownedBy: 0, location: 14, group: 2),
        
        // Orange properties group 3
        Properties(name: "St. James Place", cost: 180, rentValues: [14, 70, 200, 550, 750, 950], houseCount: 0, houseCost: 100, owned: false, ownedBy: 0, location: 16, group: 3),
        Properties(name: "Tennessee Avenue", cost: 180, rentValues: [14, 70, 200, 550, 750, 950], houseCount: 0, houseCost: 100, owned: false, ownedBy: 0, location: 18, group: 3),
        Properties(name: "New York Avenue", cost: 200, rentValues: [16, 80, 220, 600, 800, 1000], houseCount: 0, houseCost: 100, owned: false, ownedBy: 0, location: 19, group: 3),
        
        // Red properties group 4
        Properties(name: "Kentucky Avenue", cost: 220, rentValues: [18, 90, 250, 700, 875, 1050], houseCount: 0, houseCost: 150, owned: false, ownedBy: 0, location: 21, group: 4),
        Properties(name: "Indiana Avenue", cost: 220, rentValues: [18, 90, 250, 700, 875, 1050], houseCount: 0, houseCost: 150, owned: false, ownedBy: 0, location: 23, group: 4),
        Properties(name: "Illinois Avenue", cost: 240, rentValues: [20, 100, 300, 750, 925, 1100], houseCount: 0, houseCost: 150, owned: false, ownedBy: 0, location: 24, group: 4),
        
        // Yellow properties group 5
        Properties(name: "Atlantic Avenue", cost: 260, rentValues: [22, 110, 330, 800, 975, 1150], houseCount: 0, houseCost: 150, owned: false, ownedBy: 0, location: 26, group: 5),
        Properties(name: "Ventnor Avenue", cost: 260, rentValues: [22, 110, 330, 800, 975, 1150], houseCount: 0, houseCost: 150, owned: false, ownedBy: 0, location: 27, group: 5),
        Properties(name: "Marvin Gardens", cost: 280, rentValues: [24, 120, 360, 850, 1025, 1200], houseCount: 0, houseCost: 150, owned: false, ownedBy: 0, location: 29, group: 5),
        
        // Green properties group 6
        Properties(name: "Pacific Avenue", cost: 300, rentValues: [26, 130, 390, 900, 1100, 1275], houseCount: 0, houseCost: 200, owned: false, ownedBy: 0, location: 31, group: 6),
        Properties(name: "North Carolina Avenue", cost: 300, rentValues: [26, 130, 390, 900, 1100, 1275], houseCount: 0, houseCost: 200, owned: false, ownedBy: 0, location: 32, group: 6),
        Properties(name: "Pennsylvania Avenue", cost: 320, rentValues: [28, 150, 450, 1000, 1200, 1400], houseCount: 0, houseCost: 200, owned: false, ownedBy: 0, location: 34, group: 6),
        
        // Dark Blue properties group 7
        Properties(name: "Park Place", cost: 350, rentValues: [35, 175, 500, 1100, 1300, 1500], houseCount: 0, houseCost: 200, owned: false, ownedBy: 0, location: 37, group: 7),
        Properties(name: "Boardwalk", cost: 400, rentValues: [50, 200, 600, 1400, 1700, 2000], houseCount: 0, houseCost: 200, owned: false, ownedBy: 0, location: 39, group: 7),
        
        // Railroads group 8
        Properties(name: "Pennsylvania Railroad", cost: 200, rentValues: [25, 50, 100, 200], houseCount: 0, houseCost: 0, owned: false, ownedBy: 0, location: 15, group: 8),
        Properties(name: "B&O Railroad", cost: 200, rentValues: [25, 50, 100, 200], houseCount: 0, houseCost: 0, owned: false, ownedBy: 0, location: 25, group: 8),
        Properties(name: "Short Line", cost: 200, rentValues: [25, 50, 100, 200], houseCount: 0, houseCost: 0, owned: false, ownedBy: 0, location: 35, group: 8),
        
        // Utilities group 9
        Properties(name: "Electric Company", cost: 150, rentValues: [4, 10], houseCount: 0, houseCost: 0, owned: false, ownedBy: 0, location: 12, group: 9),
        Properties(name: "Water Works", cost: 150, rentValues: [4, 10], houseCount: 0, houseCost: 0, owned: false, ownedBy: 0, location: 28, group: 9)
    ]
}
/*
 Unique group #'s
 Community Chest = 10
 Chance card = 11
 */

//let communityChestOutcomes = [
//        "Advance to Go (Collect $200)",
//        "Bank error in your favor – Collect $200",
//        "Doctor’s fee – Pay $50",
//        "From sale of stock you get $50",
//        "Get Out of Jail Free – This card may be kept until needed or sold",
//        "Go to Jail – Go directly to Jail. Do not pass Go, do not collect $200",
//        "Grand Opera Night – Collect $50 from every player for opening night seats",
//        "Holiday Fund matures – Collect $100",
//        "Income tax refund – Collect $20",
//        "It’s your birthday – Collect $10 from every player",
//        "Life insurance matures – Collect $100",
//        "Pay hospital fees of $100",
//        "Pay school fees of $50",
//        "Receive $25 consultancy fee",
//        "You have won a crossword competition – Collect $100",
//        "You inherit $100"
//    ]
//let chanceCardOutcomes = [
//        "Advance to Go (Collect $300)",
//        "Advance to Illinois Avenue",
//        "Advance to St. Charles Place",
//        "Advance to nearest Railroad. If unowned, you may buy it from the Bank. If owned, pay owner rent as if you landed on the property", //moveToNearestRailroad()
//        "Advance to nearest Company. If unowned, you may buy it from the Bank. If owned, pay owner rent as if you landed on the property", //moveToNearestCompany()
//        "Bank pays you dividend of $50",
//        "Go Back 3 Spaces", //back3Spaces
//        "Go directly to Jail. Do not pass Go, do not collect $200",
//        "Make general repairs on all your property. For each house pay $25, for each hotel pay $100",
//        "Pay poor tax of $15",
//        "Take a trip to Reading Railroad. If you pass Go, collect $200",
//        "Take a walk on the Boardwalk. Advance to Boardwalk",
//        "You have been elected Chairman of the Board. Pay each player $50",
//        "Your building loan matures. Collect $150",
//        "You win a crossword competition. Collect $100",
//        "You have won second prize in a beauty contest. Collect $10"
//    ]
//let propertyNames = [
//
//]

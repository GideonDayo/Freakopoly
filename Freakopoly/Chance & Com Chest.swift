//
//  Chance & Com Chest.swift
//  Freakopoly
//
//  Created by Owen Fahringer on 12/11/24.
//

import SwiftUI

enum ComChest{
    case advanceToGo
    case advanceToNextStation
    case advanceToNearestStation
    case gain50
    case advanceToBoardwalk
    case gain100
    case gain200
    case gain300
    case gain400
    case gain500
    case gain1000
    case gain2000
    case gain3000
    case gain4000
}

struct Player {
    var id: Int
    var name: String
    var balance: Int
}

struct FreakopolyFuncs{
    @State private var usedCardValues: [Int] = []
    @State private var cardIndex: Int = 0
    @State private var players: [Player] = [
        Player(id: 0, name: "Player 1", balance: 1500),
        Player(id: 1, name: "Player 2", balance: 1500),
        Player(id: 2, name: "Player 3", balance: 1500),
        Player(id: 3, name: "Player 4", balance: 1500)
    ]
    
    static let shared = FreakopolyFuncs()
    
    func handleCardEffect(comChest: ComChest, playerNumber: Int) -> String {
        var message = ""
        
        switch comChest {
        case .advanceToBoardwalk:  // Advance to Go (Collect $200)
            players[playerNumber].balance += 200
            message = "\(players[playerNumber].name) drew: Advance to Go. Collect $200."
        case .advanceToBoardwalk:  // Bank error in your favor – Collect $200
            players[playerNumber].balance += 200
            message = "\(players[playerNumber].name) drew: Bank error in your favor. Collect $200."
        case .advanceToBoardwalk:  // Doctor’s fee – Pay $50
            players[playerNumber].balance -= 50
            message = "\(players[playerNumber].name) drew: Doctor's fee. Pay $50."
        case .advanceToBoardwalk:  // From sale of stock you get $50
            players[playerNumber].balance += 50
            message = "\(players[playerNumber].name) drew: From sale of stock. You get $50."
        case .advanceToBoardwalk:  // Get Out of Jail Free – This card may be kept until needed or sold
            message = "\(players[playerNumber].name) drew: Get Out of Jail Free card. Keep it or sell it."
        case .advanceToBoardwalk:  // Go to Jail – Go directly to Jail
            message = "\(players[playerNumber].name) drew: Go to Jail. Go directly to Jail. Do not pass Go, do not collect $200."
        case .advanceToBoardwalk:  // Grand Opera Night – Collect $50 from every player
            for i in players.indices {
                if i != playerNumber {
                    players[i].balance -= 50
                    players[playerNumber].balance += 50
                }
            }
            message = "\(players[playerNumber].name) drew: Grand Opera Night. Collect $50 from every player."
        case .advanceToBoardwalk:  // Holiday Fund matures – Collect $100
            players[playerNumber].balance += 100
            message = "\(players[playerNumber].name) drew: Holiday Fund matures. Collect $100."
        case .advanceToBoardwalk:  // Income tax refund – Collect $20
            players[playerNumber].balance += 20
            message = "\(players[playerNumber].name) drew: Income tax refund. Collect $20."
        case .advanceToBoardwalk:  // It’s your birthday – Collect $10 from every player
            for i in players.indices {
                if i != playerNumber {
                    players[i].balance -= 10
                    players[playerNumber].balance += 10
                }
            }
            message = "\(players[playerNumber].name) drew: It's your birthday. Collect $10 from every player."
        case .advanceToBoardwalk:  // Life insurance matures – Collect $100
            players[playerNumber].balance += 100
            message = "\(players[playerNumber].name) drew: Life insurance matures. Collect $100."
        case .advanceToBoardwalk:  // Pay hospital fees of $100
            players[playerNumber].balance -= 100
            message = "\(players[playerNumber].name) drew: Pay hospital fees. Pay $100."
        case .advanceToBoardwalk:  // Pay school fees of $50
            players[playerNumber].balance -= 50
            message = "\(players[playerNumber].name) drew: Pay school fees. Pay $50."
        case .advanceToBoardwalk:  // Receive $25 consultancy fee
            players[playerNumber].balance += 25
            message = "\(players[playerNumber].name) drew: Receive $25 consultancy fee."
        case .advanceToBoardwalk:  // You have won a crossword competition – Collect $100
            players[playerNumber].balance += 100
            message = "\(players[playerNumber].name) drew: You won a crossword competition. Collect $100."
        case .advanceToBoardwalk:  // You inherit $100
            players[playerNumber].balance += 100
            message = "\(players[playerNumber].name) drew: You inherit $100."
        default:
            message = "Invalid card"
        }
        
        return message
    }
}



//class ChanceCardService{
//    
//    let shared = ChanceCardService()
//    
//    func handleCardEffect(chanceCard: ChanceCard, playerNumber: Int) -> String {
//            var message = ""
//            
//        switch chanceCard {
//        case .advanceToBoardwalk:  // Advance to Go (Collect $200)
//                players[playerNumber].balance += 200
//                message = "\(players[playerNumber].name) drew: Advance to Go. Collect $200."
//            case 1:  // Bank error in your favor – Collect $200
//                players[playerNumber].balance += 200
//                message = "\(players[playerNumber].name) drew: Bank error in your favor. Collect $200."
//            case 2:  // Doctor’s fee – Pay $50
//                players[playerNumber].balance -= 50
//                message = "\(players[playerNumber].name) drew: Doctor's fee. Pay $50."
//            case 3:  // From sale of stock you get $50
//                players[playerNumber].balance += 50
//                message = "\(players[playerNumber].name) drew: From sale of stock. You get $50."
//            case 4:  // Get Out of Jail Free – This card may be kept until needed or sold
//                message = "\(players[playerNumber].name) drew: Get Out of Jail Free card. Keep it or sell it."
//            case 5:  // Go to Jail – Go directly to Jail
//                message = "\(players[playerNumber].name) drew: Go to Jail. Go directly to Jail. Do not pass Go, do not collect $200."
//            case 6:  // Grand Opera Night – Collect $50 from every player
//                for i in players.indices {
//                    if i != playerNumber {
//                        players[i].balance -= 50
//                        players[playerNumber].balance += 50
//                    }
//                }
//                message = "\(players[playerNumber].name) drew: Grand Opera Night. Collect $50 from every player."
//            case 7:  // Holiday Fund matures – Collect $100
//                players[playerNumber].balance += 100
//                message = "\(players[playerNumber].name) drew: Holiday Fund matures. Collect $100."
//            case 8:  // Income tax refund – Collect $20
//                players[playerNumber].balance += 20
//                message = "\(players[playerNumber].name) drew: Income tax refund. Collect $20."
//            case 9:  // It’s your birthday – Collect $10 from every player
//                for i in players.indices {
//                    if i != playerNumber {
//                        players[i].balance -= 10
//                        players[playerNumber].balance += 10
//                    }
//                }
//                message = "\(players[playerNumber].name) drew: It's your birthday. Collect $10 from every player."
//            case 10:  // Life insurance matures – Collect $100
//                players[playerNumber].balance += 100
//                message = "\(players[playerNumber].name) drew: Life insurance matures. Collect $100."
//            case 11:  // Pay hospital fees of $100
//                players[playerNumber].balance -= 100
//                message = "\(players[playerNumber].name) drew: Pay hospital fees. Pay $100."
//            case 12:  // Pay school fees of $50
//                players[playerNumber].balance -= 50
//                message = "\(players[playerNumber].name) drew: Pay school fees. Pay $50."
//            case 13:  // Receive $25 consultancy fee
//                players[playerNumber].balance += 25
//                message = "\(players[playerNumber].name) drew: Receive $25 consultancy fee."
//            case 14:  // You have won a crossword competition – Collect $100
//                players[playerNumber].balance += 100
//                message = "\(players[playerNumber].name) drew: You won a crossword competition. Collect $100."
//            case 15:  // You inherit $100
//                players[playerNumber].balance += 100
//                message = "\(players[playerNumber].name) drew: You inherit $100."
//            default:
//                message = "Invalid card"
//            }
//            
//            return message
//        }
//}



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

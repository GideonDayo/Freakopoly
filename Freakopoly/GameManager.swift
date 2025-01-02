//
//  GameManager.swift
//  Freakopoly
//
//  Created by Owen Fahringer on 12/2/24.
//

import Foundation
import SwiftUI
import Firebase

class GameManager: ObservableObject {
    @Published var gameRoom: GameRoom?
    
    @Published var communityChestOutcomes: [ComChest] = []
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var comChest: ComChest = .advanceToBoardwalk

    static let shared = GameManager()
    
    func getRoomFromFirebase(roomCode: String) {
        
    }
    func resetCommunityChest() {
        communityChestOutcomes = [.advanceToBoardwalk, .advanceToGo, .advanceToBoardwalk, .advanceToGo, .advanceToBoardwalk, .advanceToGo, .advanceToBoardwalk, .advanceToGo, .advanceToBoardwalk, .advanceToGo]
        communityChestOutcomes.shuffle()
    }
    func getCommunityChest() -> ComChest {
        if(communityChestOutcomes.count > 0){
            comChest = communityChestOutcomes.removeFirst()
            return comChest
        }else{
            resetCommunityChest()
            comChest = communityChestOutcomes.removeFirst()
            return comChest
        }
    }
    
    func landedOnComChest(playerNumber: Int){
        if(communityChestOutcomes.count > 0){
            comChest = communityChestOutcomes.removeFirst()
            alertMessage = FreakopolyFuncs.shared.handleCardEffect(comChest: comChest, playerNumber: playerNumber)
            showAlert.toggle()
        }else{
            resetCommunityChest()
            comChest = communityChestOutcomes.removeFirst()
        }
    }
    func generateCode() -> String{ //generates a random code containing all the variables in charset used for room code
        let charset = ["1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        var result = ""
        var random = 0
        for i in 1 ... 5 {
            random = Int.random(in: 0..<charset.count)
            result += charset[random]
        }
    return result
    }
}

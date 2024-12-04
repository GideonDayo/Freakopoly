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
    
    
    
    let shared = GameManager()
    
    func getRoomFromFirebase(roomCode: String) {
        
    }
    

}

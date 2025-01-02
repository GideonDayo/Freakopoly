//
//  GameRoom.swift
//  Freakopoly
//
//  Created by Owen Fahringer on 12/2/24.
//
import SwiftUI
import Firebase
import FirebaseFirestore

class GameRoom: Identifiable{
    var maxPlayers: Int
    var playerCount: Int
    
//    var player: [Player]
    var id: String
    init(maxplayers: Int, playerCount: Int, id: String){
        self.maxPlayers = maxplayers
        self.playerCount = playerCount
        self.id = id
    }
    init(){
        self.maxPlayers = 4
        self.playerCount = 1
        id = UUID().uuidString
    }
    
    init(data: [String: Any]) {
        self.maxPlayers = data["maxPlayers"] as? Int ?? 4
        self.playerCount = data["playerCount"] as? Int ?? 1
        self.id = data["id"] as? String ?? UUID().uuidString
    }
    
    init(snapshot: DocumentSnapshot) {
        if let data = snapshot.data() {
            self.maxPlayers = data["maxPlayers"] as? Int ?? 4
            self.playerCount = data["playerCount"] as? Int ?? 1
            self.id = snapshot.documentID
        } else {
            
            print("Error in snapshot for iniit in game room")
//            fatalError("Unable to decode snapshot")
            self.maxPlayers = 4
            self.playerCount = 1
            id = UUID().uuidString
            
        }
    }
    
    func toDictionary() -> [String: Any] {
        return [
            "maxPlayers": maxPlayers,
            "playerCount": playerCount,
            "id": id
        ]
    }
    

}

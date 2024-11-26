//
//  FreakopolyApp.swift
//  Freakopoly
//
//  Created by Gideon Dayo on 11/8/24.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        FirebaseApp.configure()
        print("app loaded")
    }
}



@main
struct FreakopolyApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
//    init() {
//        FirebaseApp.configure()
//        print("Firebase configured")
//    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()

        }
    }
    
    func setupFirestore() {
        let db = Firestore.firestore()
        db.collection("Test").document("1").setData(["name": "Hello, World!"]) { error in
            if let error = error {
                print("Error writing document: \(error.localizedDescription)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}

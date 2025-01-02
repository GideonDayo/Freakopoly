//
//  NameEntry.swift
//  Freakopoly
//
//  Created by Owen Fahringer on 12/3/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseCore

struct NameEntry: View {
    @Binding var enteredCode: String
    @State var name: String = ""
    @State var isLoading: Bool = false
    @State var error: Error?
    
    var body: some View {
        VStack{
            Text("\(enteredCode)")
            TextField("Enter your name", text: $name)
                .padding()
                .autocorrectionDisabled()
            
        }
    }
}

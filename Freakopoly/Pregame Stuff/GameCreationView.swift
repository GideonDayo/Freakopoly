//
//  GameCreationView.swift
//  Freakopoly
//
//  Created by Owen Fahringer on 12/2/24.
//
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseCore

struct GameCreationView: View {
    @State var enteredCode: String
    @State var userName: String
    @State private var goesToDetail: Bool = false
    @State var errorMessage: String = ""
    
    //sidebar
    @State private var isSidebarVisible = false
    @State private var isDarkMode = false
    @State private var isNotificationsEnabled = true
    @State private var isLocationAccessGranted = false
    @State private var settings: [Setting] = [ //settings
            Setting(name: "Even Build"),
            Setting(name: "Rent in Jail"),
            Setting(name: "Mortgaging"),
            Setting(name: "Vacation Cash"),
            Setting(name: "Auction"),
            Setting(name: "Random turn order")
        ]
    
    var body: some View {
        NavigationStack{
            HStack{
                ZStack{ //Sidebar button
                    Button {
                        // Toggle Sidebar visibility
                        withAnimation {
                            isSidebarVisible.toggle()
                        }
                    } label: {
                        ZStack{
                            Text("Settings") //This is the text for the sidebar view
                                .font(.title)
                                .padding()
                                .foregroundColor(.white)
                                .cornerRadius(30)
                        }
                    }
                    
                    if isSidebarVisible {
                        SidebarView(isSidebarVisible: $isSidebarVisible, isDarkMode: $isDarkMode, isNotificationsEnabled: $isNotificationsEnabled, isLocationAccessGranted: $isLocationAccessGranted, settings: $settings)
                            .transition(.move(edge: .leading)) // Slide-in transition
                            .zIndex(1) // Bring sidebar in front of main content
                    }
                }
                VStack{
                    Text("Enter game code:")
                        .underline()
                        .bold()
                        .font(.title)
                    TextField("Enter code", text: $enteredCode)
                        .onSubmit{
                            if (enteredCode.count > 5){
                                let index = enteredCode.index(enteredCode.startIndex, offsetBy: 5)
                                let mySubstring = enteredCode.prefix(upTo: index)
                                enteredCode = String(mySubstring) //String of substring stops swift from holding full string
                            }
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width:300)
                    HStack{ //Buttons
                        Button { //Create game
                            let db = Firestore.firestore()
                            let code = generateCode()
                            let gameRoom = GameRoom(maxplayers: 4, playerCount: 1, id: code)
                            db.collection("Games").document("\(code)").setData(gameRoom.toDictionary()) {
                                error in
                                if let err = error {
                                    print(err)
                                    return
                                }
                                print("Created new Room: \(code)")
                                
                            }
                        } label: {
                            Text("Create Game")
                        }
                        Button { //Join game
                            getDataFromFirebase { room in
                                if(room != nil){
                                    goesToDetail = true
                                }
                            }
                            //GameManager.shared.getRoomFromFirebase(roomCode: <#T##String#>)
                        } label: {
                            Text("Join Game")
                        }
                    }
                    Text("\(errorMessage)")
                }
            }
            .navigationDestination(isPresented: $goesToDetail) {
                NameEntry(enteredCode: $enteredCode)
            }
        }
    }
    func getDataFromFirebase(completion: @escaping ((GameRoom?) -> Void)) {
        let db = Firestore.firestore()
        db.collection("Games").document("\(enteredCode)").getDocument() { snapshot, error in
            if let err = error {
                print(err)
                errorMessage = "Could not find game room with code: \(enteredCode)"
                completion(nil)
                
            }
            if let snap = snapshot {
                if snap.exists {
                    let foundGameRoom = GameRoom(snapshot: snap)
                    print("Found Game Room: \(foundGameRoom.id)")
                    completion(foundGameRoom)
                }else {
                    errorMessage = "Could not find game room with \n code: \(enteredCode)"
                    print("Did not find game room with code: \(enteredCode)")
                    completion(nil)
                    
                }
            }
            errorMessage = "Could not find game room with code: \(enteredCode)"
            completion(nil)
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
                    .padding(5)
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
            //inner box visuals
            .frame(maxWidth: 300, maxHeight: 500)
            .background(Color.gray.opacity(0.8))
            .cornerRadius(10)
            .padding()
        }
        //outer box visuals
        .frame(width: 300)
        .background(Color.gray)
        .cornerRadius(30)
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.vertical)
    }
}

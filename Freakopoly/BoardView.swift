//
//  BoardView.swift
//  Freakopoly
//
//  Created by Owen Fahringer on 11/14/24.
//

import SwiftUI

struct BoardView: View {
    @State var topHeight: [Int] = [90,80,80,80,80,80,80,80,80,100]
    @State var count: Int = 0
    var body: some View {
        ZStack{
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.black)
            HStack{
                ForEach(0..<topHeight.count, id:\.self){index in
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width:90 ,height: Double(topHeight[index]))
                    
//                    if(topHeight[index] == 100){
//                            RoundedRectangle(cornerRadius:5)
//                                .frame(width:100, height: Double(topHeight[index]))//figure out how to fix height as topHeight[]
//                        VStack{
//                            ForEach(topHeight, id:\.self){ value in
//                                RoundedRectangle(cornerRadius:5)
//                                    .frame(width:100, height: Double(topHeight[index]))//figure out how to fix height as topHeight[]
//                            }
//                        }
//                    }else{
//                            Rectangle()
//                            .frame(width:100, height: 100)//figure out how to fix height as topHeight[]
//                    }
                }
            }
        }
        Text("Hi")
    }
}

#Preview{
    BoardView()
}

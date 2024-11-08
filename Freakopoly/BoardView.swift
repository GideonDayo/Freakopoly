//
//  BoardView.swift
//  Freakopoly
//
//  Created by Owen Fahringer on 11/14/24.
//

import SwiftUI

struct BoardView: View {
    @State var topHeight: [Int] = [100,80,80,80,80,80,80,80,80,100]
    @State var count: Int = 0
    var body: some View {
//        ZStack{
//            Rectangle()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .foregroundStyle(.black)
//            HStack{
//                ForEach(topHeight, id:\.self){index in
//                    if(topHeight[index] == 100){
//                        VStack{
//                            Rectangle()
//                                .frame(width:100, height: 100)//figure out how to fix height as topHeight[]
//                            ForEach(topHeight, id:\.self){ value in
//                                Rectangle()
//                                    .frame(width:100, height: 100)//figure out how to fix height as topHeight[]
//                            }
//                        }
//                    }else{
//                            Rectangle()
//                                .frame(width:100, height: 100)//figure out how to fix height as topHeight[]
//                    }
//                }
//            }
//        }
        Text("Hi")
    }
}

#Preview{
    BoardView()
}

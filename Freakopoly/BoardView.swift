//
//  BoardView.swift
//  Freakopoly
//
//  Created by Owen Fahringer on 11/14/24.
//

import SwiftUI

struct BoardView: View {
    // Constants for sizes
    let cornerSize: CGFloat = 100
    let sideWidth: CGFloat = 80
    let sideHeight: CGFloat = 100
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            // The square board layout
            VStack(spacing: -10) {
                // Top row (horizontal)
                HStack(spacing: 0) {
                    BoardCellView(width: cornerSize, height: cornerSize) // top left
                    ForEach(0..<8) { _ in
                        BoardCellView(width: sideWidth, height: sideHeight) // horiz spaces
                    }
                    BoardCellView(width: cornerSize, height: cornerSize) // top right
                }
             
                
                // L  R Columns
                HStack(spacing: 0) {
                    VStack(spacing: -19) {
                        ForEach(0..<8) { _ in
                            BoardCellView(width: sideWidth, height: sideHeight)
                                .rotationEffect(.degrees(90))// reg vert
                        }
                    }
                    
                    Spacer().frame(width: 675) // space between L & R
                    
                    VStack(spacing: -19) {
                        ForEach(0..<8) { _ in
                            BoardCellView(width: sideWidth, height: sideHeight)
                                .rotationEffect(.degrees(90))//
                        }
                    }
                }
                
                // Bottom row (horizontal)
                HStack(spacing: 0) {
                    BoardCellView(width: cornerSize, height: cornerSize) // bottom left
                    ForEach(0..<8) { _ in
                        BoardCellView(width: sideWidth, height: sideHeight) // bottom mid
                    }
                    BoardCellView(width: cornerSize, height: cornerSize) // bottom right
                }
            }
            .padding(100)
        }
    }
}




struct BoardCellView: View {
    let width: CGFloat
    let height: CGFloat
    
    init(width: CGFloat, height: CGFloat? = nil) {
        self.width = width
        self.height = height ?? width // Default to square if height is not specified
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: width, height: height)
            .foregroundColor(.white)
            .padding(1)
    }
    
    struct BoardView_Previews: PreviewProvider {
        static var previews: some View {
            BoardView()
        }
    }
}

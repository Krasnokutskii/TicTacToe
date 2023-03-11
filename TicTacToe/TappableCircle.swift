//
//  TappableCircle.swift
//  TicTacToe
//
//  Created by Yaroslav Krasnokutskiy on 11.3.23..
//

import SwiftUI

struct TappableCircle: View {
    
    @State var color: ColorState = .empty
    @Binding var firstPlayer: Bool
    @Binding var resetTapped: Bool
    
    var body: some View {
        Circle()
            .onTapGesture {
                rectangleTapped()
        }
            .padding(5)
            .foregroundColor(color.getColor)
            .onChange(of: resetTapped) { value in
                    color = .empty
            }
    }
    
    func rectangleTapped()->Void {
        guard color == .empty else {
            return
        }
        color = firstPlayer ? .firsPlayer : .secondPlayer
        firstPlayer = !firstPlayer
    }
}

struct TappableCircle_Previews: PreviewProvider {
    static var previews: some View {
        TappableCircle(firstPlayer: Binding.constant(true), resetTapped: Binding.constant(false))
    }
}

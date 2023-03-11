//
//  ContentView.swift
//  TicTacToe
//
//  Created by Yaroslav Krasnokutskiy on 11.3.23..
//

import SwiftUI

struct ContentView: View {
    @State var topFirst: ColorState = .empty
    @State var whoTapping = true
    @State var resetTapped = false
    
    var body: some View {
        ZStack{
            Color.orange
            VStack {
                Text("Tic Tac Toe")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Spacer()
                    .frame(height: 50)
                ForEach(0..<3){_ in
                    HStack{
                        ForEach(0..<3){_ in
                            VStack{
                                TappableCircle(firstPlayer: $whoTapping, resetTapped: $resetTapped)
                            }
                        }
                    }
                }
                .padding(25)
                Spacer()
                    .frame(height:75)
                Button("RESET") {
                    resetTapped.toggle()
                }
                .buttonStyle(.borderedProminent)
                .font(.largeTitle)
                .frame(width: 400, height: 50)
                
            }
        }
        .ignoresSafeArea()
    }
    
}

enum ColorState {
    
    case empty
    case firsPlayer
    case secondPlayer
    
    var getColor: Color {
        switch self {
        case .empty:
            return .black
        case .firsPlayer:
            return .red
        case .secondPlayer:
            return .blue
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

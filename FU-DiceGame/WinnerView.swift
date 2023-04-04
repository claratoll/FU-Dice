//
//  WinnerView.swift
//  FU-DiceGame
//
//  Created by Clara Toll on 2023-04-04.
//

import SwiftUI

struct SheetView : View {
    var points : Int
    var won : Bool
    var body: some View{
        VStack{
            
            if !won{
                Text("You won with \(points)!")
                    .font(.title)
            } else {
                Text("AI won with \(points)")
                    .font(.title)
            }
        }
    }
}

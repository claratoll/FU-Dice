//
//  Dice.swift
//  FU-DiceGame
//
//  Created by Clara Toll on 2023-04-04.
//

import SwiftUI

struct Dice : View {
    var diceNumber = 1
    var body: some View{
        
        Image(systemName: "die.face.\(diceNumber)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background(.white)
            .cornerRadius(26.0)
            .padding()
    }
}

//
//  ContentView.swift
//  FU-DiceGame
//
//  Created by Clara Toll on 2023-04-03.
//

import SwiftUI

struct ContentView: View {
    @State var diceNumber1 = 1
    @State var diceNumber2 = 1
    @State var diceNumber3 = 1
    @State var diceNumber4 = 1
    @State private var backgroundColor = Color.white
    @State var isAITurn = false
    @State var AIPoints = 0
    @State var userPoints = 0
    
    var body: some View {
        VStack {
            Spacer()
                Text("AI")
                    .font(.title)
            Text("AI points: \(AIPoints) /10")
                .font(.headline)
                
            Spacer()
            HStack{
                VStack{
                    Image(systemName: "die.face.\(diceNumber1)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .background(.white)
                        .cornerRadius(26.0)
                        .padding()
                    Image(systemName: "die.face.\(diceNumber2)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .background(.white)
                        .cornerRadius(26.0)
                        .padding()
                }
                VStack{
                    Image(systemName: "die.face.\(diceNumber3)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .background(.white)
                        .cornerRadius(26.0)
                        .padding()
                    Image(systemName: "die.face.\(diceNumber4)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .background(.white)
                        .cornerRadius(26.0)
                        .padding()
                }
            }
            Spacer()
            Text("User points: \(userPoints) /10")
                .font(.headline)
            if !isAITurn{
                Button(action: {
                    //user turn
                    rollDice()
                    self.backgroundColor = Color.red
                    isAITurn = true
                    AIRollDice()
                }, label: {
                    Text("Roll dice")
                        .font(.title)
                })
            }
            Spacer()
        }
        .padding()
        .background(backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    func rollDice(){
        diceNumber1 = Int.random(in: 1...6)
        diceNumber2 = Int.random(in: 1...6)
        diceNumber3 = Int.random(in: 1...6)
        diceNumber4 = Int.random(in: 1...6)
        
        let points = checkIfPoints()
        
        userPoints += points
        
    }
    
    func AIRollDice(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            diceNumber1 = Int.random(in: 1...6)
            diceNumber2 = Int.random(in: 1...6)
            diceNumber3 = Int.random(in: 1...6)
            diceNumber4 = Int.random(in: 1...6)
            
            let points = checkIfPoints()
            
            AIPoints += points
            
            self.backgroundColor = Color.green
            isAITurn = false
        }
    }
    
    func checkIfPoints() -> Int{
        var points = 0
        let numbers = [diceNumber1, diceNumber2, diceNumber3, diceNumber4]
        
        for i in 0..<numbers.count {
            for j in i+1..<numbers.count {
                if numbers[i] == numbers[j] {
                    points += 1
                }
            }
        }
        print("Points: \(points)")
        return points
    }
   
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

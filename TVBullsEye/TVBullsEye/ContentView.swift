//
//  ContentView.swift
//  TVBullsEye
//
//  Created by Eric Golovin on 01.08.2020.
//

import SwiftUI
import Game

struct ContentView: View {
    @ObservedObject var game = BullsEyeGame()
    
    @State var currentValue = 50.0
    @State var valueString: String = ""
    @State var showAlert = false
    
    var body: some View {
        VStack {
            Text("Guess the number:")
            TextField("1-100", text: $valueString, onEditingChanged: { _ in
                self.currentValue = Double(self.valueString) ?? 50.0
            }).frame(width: 250).multilineTextAlignment(.center)
            
            HStack {
                Text("0")
                GeometryReader { geometry in
                    ZStack {
                        let center = (x: geometry.size.width / 2, y: geometry.size.height / 2)
                        Rectangle().frame(height: 8.0).position(x: center.x, y: center.y)
                        Rectangle().frame(width: 8.0, height: 30.0).offset(x: geometry.size.width * (CGFloat(self.game.targetValue) / 100.0 - 0.5), y: 0.0).position(x: center.x, y: center.y)
                    }
                }
                Text("100")
            }.padding(.horizontal)
            
            Button(action: {
                self.showAlert = true
                self.game.checkGuess(Int(self.currentValue))
            }, label: {
                Text("Hit Me")
            }).alert(isPresented: $showAlert, content: {
                Alert(title: Text("Your Score"), message: Text(String(game.scoreRound)), dismissButton: .default(Text("OK"), action: {
                    self.game.startNewGame()
                    self.valueString = ""
                }))
            }).padding()
            
            HStack {
                Text("Total Score: \(game.scoreTotal)")
                Text("Round: \(game.round)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

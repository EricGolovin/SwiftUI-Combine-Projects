//
//  ContentView.swift
//  BullaEyePlus WatchKit Extension
//
//  Created by Eric Golovin on 27.07.2020.
//

import SwiftUI
import Game

struct ContentView: View {
    @ObservedObject private var game = BullsEyeGame()

    @State private var currentValue = 50.0
    @State private var showAlert = false

    private var alpha: Double {
        abs(Double(game.targetValue) - currentValue) / 100.0
    }

    var body: some View {
        VStack {
            Text("Aim for: \(game.targetValue)")
            HStack {
                Text("0")
                Slider(value: $currentValue, in: 1.0...100.0)
                    .digitalCrownRotation($currentValue, from: 1.0, through: 100.0)
                    .background(Color.red)
                    .opacity(alpha)
                Text("100")
            }
            .padding(.horizontal)
            Button(action: {
                self.showAlert = true
                self.game.checkGuess(Int(self.currentValue))
            }) {
                Text("Hit Me!")
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Your Score"), message: Text(String(game.scoreRound)),
                      dismissButton: .default(Text("OK"), action: {
                        self.game.startNewRound()
                        self.currentValue = 50.0
                      }))
            }
            .padding()
            HStack {
                Text("Total: \(game.scoreTotal)").font(.headline)
                Text("Round: \(game.round)").font(.callout)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Eric Golovin on 23.07.2020.
//

import SwiftUI

struct ContentView: View {
    @State var rTarget = Double.random(in: 0..<1)
    @State var gTarget = Double.random(in: 0..<1)
    @State var bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    @State var showAlert = false
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Color(red: rTarget, green: gTarget, blue: bTarget).cornerRadius(10.0)
                    Text("Match this color")
                }
                VStack {
                    Color(red: rGuess, green: gGuess, blue: bGuess).cornerRadius(10.0)
                    Text("R: \(Int(rGuess * 255.0)) G: \(Int(gGuess * 255.0)) B: \(Int(bGuess * 255.0))" )
                }
            }.padding(.bottom)
            
            Button(action: { self.showAlert = true }) {
                Text("Hit Me!").fontWeight(.bold).font(.title)
            }.alert(isPresented: $showAlert, content: {
                Alert(title: Text("Your Score"), message: Text(String(computeScore())), primaryButton: .default(Text("New color"), action: {
                    rTarget = Double.random(in: 0..<1)
                    gTarget = Double.random(in: 0..<1)
                    bTarget = Double.random(in: 0..<1)
                    rGuess = 0.5
                    gGuess = 0.5
                    bGuess = 0.5
                }), secondaryButton: .cancel(Text("Cancel")))
            }).padding()
            
            ColorSlider(value: $rGuess, textColor: .red)
            ColorSlider(value: $gGuess, textColor: .green)
            ColorSlider(value: $bGuess, textColor: .blue)
        }.padding()
    }
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
            Text("255").foregroundColor(textColor)
        }.padding(.horizontal)
    }
}

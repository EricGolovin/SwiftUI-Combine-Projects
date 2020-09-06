//
//  WelcomeMessageView.swift
//  Kuchi-App
//
//  Created by Eric Golovin on 06.09.2020.
//

import SwiftUI

struct WelcomeMessageView: View {
    var body: some View {
        VStack {
            Text("Welcome to")
                .font(.headline)
                .bold()
            Text("Kuchi")
                .font(.largeTitle)
                .bold()
        }
        .foregroundColor(.red)
        .lineLimit(2)
        .multilineTextAlignment(.leading)
        .padding(.horizontal)
    }
}

struct WelcomeMessageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeMessageView()
    }
}

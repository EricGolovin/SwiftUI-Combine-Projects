//
//  RegisterView.swift
//  Kuchi-App
//
//  Created by Eric Golovin on 06.09.2020.
//

import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            WelcomeMessageView()
            TextField("Type your name...", text: $name)
                .bordered()
        }
        .padding()
        .background(WelcomeBackgroundImage())
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

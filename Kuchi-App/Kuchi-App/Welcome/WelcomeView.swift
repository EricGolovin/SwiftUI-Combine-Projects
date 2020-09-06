//
//  WelcomeView.swift
//  Kuchi-App
//
//  Created by Eric Golovin on 09.08.2020.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            WelcomeBackgroundImage()
            HStack {
                LogoImage()
                WelcomeMessageView()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

//
//  WelcomeBackgroundImage.swift
//  Kuchi-App
//
//  Created by Eric Golovin on 06.09.2020.
//

import SwiftUI

struct WelcomeBackgroundImage: View {
    var body: some View {
        Image("welcome-background", bundle: nil)
            .resizable()
            .aspectRatio(1 / 1, contentMode: .fill)
//            .edgesIgnoringSafeArea(.all)
            .saturation(0.5)
            .blur(radius: 5)
            .opacity(0.08)
    }
}

struct WelcomeBackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBackgroundImage()
    }
}

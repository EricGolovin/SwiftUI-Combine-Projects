//
//  BorderViewModifier.swift
//  Kuchi-App
//
//  Created by Eric Golovin on 06.09.2020.
//

import SwiftUI

struct BorderViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.blue)
            )
            .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
    }
}

extension View {
    func bordered() -> some View {
        ModifiedContent(content: self, modifier: BorderViewModifier())
    }
}

//
//  RegisterView.swift
//  Kuchi-App
//
//  Created by Eric Golovin on 06.09.2020.
//

import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @ObservedObject var keyboardHandler: KeyboardFollower
    @EnvironmentObject var userManager: UserManager
    
    init(keyboardHandler: KeyboardFollower) {
        self.keyboardHandler = keyboardHandler
    }
    
    var body: some View {
        VStack {
            WelcomeMessageView()
            
            TextField("Type your name...", text: $userManager.profile.name)
                .bordered()
            
            HStack {
                Spacer()
                
                Text("\(userManager.profile.name.count)")
                    .font(.caption)
                    .foregroundColor(userManager.isUserNameValid() ? .green : .red)
                    .padding(.trailing)
            }
            
            HStack {
                Spacer()
                
                Toggle(isOn: $userManager.settings.rememberUser) {
                    Text("Remember me")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 16, height: 16, alignment: .center)
                    Text("OK")
                        .font(.body)
                        .bold()
                }
                .bordered()
            }
            .disabled(!userManager.isUserNameValid())
        }
        .padding()
        .background(WelcomeBackgroundImage())
    }
}

struct RegisterView_Previews: PreviewProvider {
    static let user = UserManager(name: "Ray")
    
    static var previews: some View {
        RegisterView(keyboardHandler: KeyboardFollower())
            .environmentObject(user)
    }
}

// MARK: - Event Handlers
extension RegisterView {
    func registerUser() {
        if userManager.settings.rememberUser {
            userManager.persistProfile()
        } else {
            userManager.clear()
        }
        
        userManager.persistSettings()
    }
}

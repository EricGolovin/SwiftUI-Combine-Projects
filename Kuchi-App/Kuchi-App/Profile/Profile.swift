//
//  Profile.swift
//  Kuchi-App
//
//  Created by Eric Golovin on 07.09.2020.
//

import Foundation

struct Profile: Codable {
    var name: String
    
    init() {
        self.name = ""
    }
    
    init(named name: String) {
        self.name = name
    }
}

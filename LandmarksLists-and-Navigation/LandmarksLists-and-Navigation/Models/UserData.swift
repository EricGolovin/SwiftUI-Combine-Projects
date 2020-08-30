//
//  UserData.swift
//  LandmarksLists-and-Navigation
//
//  Created by Eric Golovin on 24.08.2020.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}

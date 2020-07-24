//
//  TimerCounter.swift
//  RGBullsEye
//
//  Created by Eric Golovin on 24.07.2020.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    var timer: Timer?
    @Published var counter = 0
    
    @objc func updateCounter() {
        counter += 1
    }
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func killTimer() {
        timer?.invalidate()
        counter = 0
        timer = nil
    }
    
    func startNewTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
}

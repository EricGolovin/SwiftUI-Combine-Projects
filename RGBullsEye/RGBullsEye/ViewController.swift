//
//  ViewController.swift
//  RGBullsEye
//
//  Created by Eric Golovin on 27.07.2020.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    private var currentValue = 50
    private var targetValue = Int.random(in: 1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        targetLabel.text = String(targetValue)
    }
    
    @IBAction func hitMeTapped(_ sender: UIButton) {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        let alert = UIAlertController(title: "Your Score",
                                      message: String(points), preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(slider.value)
    }
}

struct ViewControllerRepresentation: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}

struct ViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentation()
    }
}

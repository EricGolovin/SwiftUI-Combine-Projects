//
//  ColorUISlider.swift
//  RGBullsEye
//
//  Created by Eric Golovin on 27.07.2020.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
    var color: UIColor
    @Binding var value: Double
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
    func makeUIView(context: Context) -> some UIView {
        let slider = UISlider(frame: .zero)
        slider.thumbTintColor = color
        slider.minimumTrackTintColor = color
        slider.maximumTrackTintColor = .white
        slider.value = Float(value)
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let slider = uiView as? UISlider else { return }
        slider.value = Float(self.value)
    }
    
    class Coordinator: NSObject {
        var value: Binding<Double>
        
        init(value: Binding<Double>) {
            self.value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            self.value.wrappedValue = Double(sender.value)
            sender.alpha = sender.value <= 0.1 ? CGFloat(0.1) : CGFloat(sender.value)
        }
    }
}

struct ColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorUISlider(color: .red, value: .constant(0.5))
    }
}

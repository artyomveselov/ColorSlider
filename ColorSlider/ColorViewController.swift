//
//  ViewController.swift
//  ColorSlider
//
//  Created by temaveselov on 07.02.2023.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet var RGBView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var delegate: ColorViewControllerDelegate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RGBView.layer.cornerRadius = 20
        RGBView.backgroundColor = viewColor
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        
        setSliders()
        setValue(for: redLabel, greenLabel, blueLabel)
    }

    @IBAction func rgbSliderAction(_ sender: UISlider) {
        
        switch sender {
        case redSlider:
            setValue(for: redLabel)
        case greenSlider:
            setValue(for: greenLabel)
        default:
            setValue(for: blueLabel)
        }
        
        setColor()
    }
}

// MARK: - Private Methods
extension ColorViewController {
    
    private func setColor() {
        RGBView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = string(from: redSlider)
            case greenLabel:
                greenLabel.text = string(from: greenSlider)
            default:
                blueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func setSliders() {
        let ciColor = CIColor()
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}


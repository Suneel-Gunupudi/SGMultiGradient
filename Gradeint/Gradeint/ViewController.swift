//
//  ViewController.swift
//  Gradeint
//
//  Created by Suneel Gunupudi on 10/08/20.
//  Copyright © 2020 Suneel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gradeintContentView: UIView!
    @IBOutlet weak var startXLbl: UILabel!
    @IBOutlet weak var startYLbl: UILabel!

    @IBOutlet weak var endXLbl: UILabel!
    @IBOutlet weak var endYLbl: UILabel!
    @IBOutlet weak var startXSlider: UISlider!
    @IBOutlet weak var startYSlider: UISlider!

    @IBOutlet weak var endXSlider: UISlider!
    @IBOutlet weak var endYSlider: UISlider!

    var gradientLayer: CAGradientLayer?

    var startPoint: CGPoint = CGPoint(x: 0, y: 0.5)
    var endPoint: CGPoint = CGPoint(x: 1.0, y: 0.6)

    override func viewDidLoad() {
        super.viewDidLoad()
        startXSlider.value = Float(startPoint.x)
        startYSlider.value = Float(startPoint.y)

        endXSlider.value = Float(endPoint.x)
        endYSlider.value = Float(endPoint.y)

        startXLbl.text = "X - \(startPoint.x)"
        startYLbl.text = "Y - \(startPoint.y)"

        endXLbl.text = "X - \(endPoint.x)"
        endYLbl.text = "Y - \(endPoint.y)"
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addGradientLayer()
    }

    func updateSlider(_ slider: UISlider) {
        // Restrict slider to a fixed value
        let steps: Float = 0.1
       let fixed = roundf(slider.value / steps) * steps;
       slider.setValue(fixed, animated: false)
    }

    @IBAction func startXpositionAction(_ sender: UISlider) {
        updateSlider(sender)

        startXLbl.text = "X - \(sender.value)"
        startPoint.x = CGFloat(sender.value)
        addGradientLayer()
    }

    @IBAction func startYpositionAction(_ sender: UISlider) {
        updateSlider(sender)
        startYLbl.text = "Y - \(sender.value)"
        startPoint.y = CGFloat(sender.value)
        addGradientLayer()
    }


    @IBAction func endXpositionAction(_ sender: UISlider) {
        updateSlider(sender)
        endXLbl.text = "X - \(sender.value)"
        endPoint.x = CGFloat(sender.value)
        addGradientLayer()
    }

    @IBAction func endYpostionAction(_ sender: UISlider) {
        updateSlider(sender)
        endYLbl.text = "Y - \(sender.value)"
        endPoint.y = CGFloat(sender.value)
        addGradientLayer()
    }

    func addGradientLayer() {
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = gradeintContentView.bounds
        gradientLayer?.colors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.orange.cgColor, UIColor.green.cgColor, UIColor.black.cgColor]
        gradientLayer?.locations = [0.0, 0.25, 0.50, 0.75, 1.0]
        gradientLayer?.startPoint = startPoint
        gradientLayer?.endPoint = endPoint
        gradeintContentView.layer.addSublayer(gradientLayer!)
    }

}


//
//  ProjectileMotion.swift
//  Physics
//
//  Created by Ikey Benzaken on 12/14/15.
//  Copyright © 2015 Ikey Benzaken. All rights reserved.
//

import UIKit

class ProjectileMotion: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var positionCalcView: UIView!
    @IBOutlet weak var initialXPos: UITextField!
    @IBOutlet weak var initialYPos: UITextField!
    @IBOutlet weak var finalXPos: UITextField!
    @IBOutlet weak var finalYPos: UITextField!
    @IBOutlet weak var initialVel: UITextField!
    @IBOutlet weak var angle: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var vo: Double!
    var xo: Double!
    var x: Double!
    var yo: Double!
    var y: Double!
    var theda: Double!
    var t: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialXPos.delegate = self
        initialYPos.delegate = self
        finalXPos.delegate = self
        finalYPos.delegate = self
        initialVel.delegate = self
        angle.delegate = self
        time.delegate = self
        // Do any additional setup after loading the view.
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.keyboardType = UIKeyboardType.DecimalPad
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == initialXPos {
            xo = Double(initialXPos.text!)
            initialYPos.becomeFirstResponder()
        }
        if textField == initialYPos {
            yo = Double(initialYPos.text!)
            finalXPos.becomeFirstResponder()
        }
        if textField == finalXPos {
            x = Double(finalXPos.text!)
            finalYPos.becomeFirstResponder()
        }
        if textField == finalYPos {
            y = Double(finalYPos.text!)
            initialVel.becomeFirstResponder()
        }
        if textField == initialVel {
            vo = Double(initialVel.text!)
            angle.becomeFirstResponder()
        }
        if textField == angle {
            theda = Double(angle.text!)
            if theda != nil {
                theda! *= (M_PI / 180)
            }
            time.becomeFirstResponder()
        }
        if textField == time {
            t = Double(time.text!)
            time.resignFirstResponder()
        }
        textField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func calculatePosition(sender: AnyObject) {
        if initialVel.text != "" && angle.text != "" && time.text != "" {
            if xo == nil && x == nil {
                initialXPos.text = "Assumed Xo: 0"
                xo = 0
                
                x = vo * cos(theda) * t
                finalXPos.text = "Final X: \(x)"
            }
            if yo == nil && y == nil {
                initialYPos.text = "Assumed Yo: 0"
                yo = 0
                
                y = (vo * sin(theda) * t) - (4.9 * (t * t))
                finalYPos.text = "Final Y: \(y)"
            }
        }
        
        if vo != nil && theda != nil && t == nil {
            if xo == nil {
                xo = 0
            }
            if yo == nil {
                yo = 0
            }
            let timeOfMaxHeight: Double = (sin(theda) * vo) / 9.8
            let maxHeight: Double = (sin(theda) * vo * timeOfMaxHeight) + yo - (4.9 * (timeOfMaxHeight * timeOfMaxHeight))
            heightLabel.text = "Max Height: \(maxHeight)"
            
            let maxDistance: Double = (cos(theda) * vo * (2 * timeOfMaxHeight)) + xo
            distanceLabel.text = "Max Distance: \(maxDistance)"
            if time.text == "" {
                let vyo = sin(theda) * vo
                let timen = -vyo + sqrt((vyo * yo) - (4 * -4.9 * yo)) / (2 * -4.9)
                time.text = "Total Time: \(timen)"
            }
        }
        // 0 = Yo + VyoT - 4.9T^2
        
        
        
    }
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}


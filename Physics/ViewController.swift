//
//  ViewController.swift
//  Physics
//
//  Created by Ikey Benzaken on 12/14/15.
//  Copyright © 2015 Ikey Benzaken. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var initialPos: UITextField!
    @IBOutlet weak var initialVel: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var acceleration: UITextField!
    @IBOutlet weak var finalPosLabel: UILabel!
    var xo: Double!
    var vxo: Double!
    var t: Double!
    var ax: Double!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialPos.delegate = self
        initialVel.delegate = self
        time.delegate = self
        acceleration.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateDistance(sender: AnyObject) {
        if xo != nil && vxo != nil && t != nil && ax != nil {
            let timeSquared = t * t
            let finalPos = xo + (vxo * t) + ((ax / 2) * timeSquared)
            finalPosLabel.text = "Final Position: \(finalPos)"
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == initialPos {
            xo = Double(initialPos.text!)
            initialVel.becomeFirstResponder()
        }
        if textField == initialVel {
            vxo = Double(initialVel.text!)
            time.becomeFirstResponder()
        }
        if textField == time {
            t = Double(time.text!)
            acceleration.becomeFirstResponder()
        }
        if textField == acceleration {
            ax = Double(acceleration.text!)
            acceleration.resignFirstResponder()
        }
        return true
    }
    
}


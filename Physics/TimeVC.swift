//
//  TimeVC.swift
//  Physics
//
//  Created by Ikey Benzaken on 12/14/15.
//  Copyright © 2015 Ikey Benzaken. All rights reserved.
//

import UIKit

class TimeVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var initalPos: UITextField!
    @IBOutlet weak var initialVel: UITextField!
    @IBOutlet weak var finalPos: UITextField!
    @IBOutlet weak var acceleration: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    
    var xo: Double!
    var x: Double!
    var vxo: Double!
    var ax: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalPos.delegate = self
        initialVel.delegate = self
        finalPos.delegate = self
        acceleration.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == initalPos {
            xo = Double(initalPos.text!)
            finalPos.becomeFirstResponder()
        }
        if textField == finalPos {
            x = Double(finalPos.text!)
            initialVel.becomeFirstResponder()
        }
        if textField == initialVel {
            vxo = Double(initialVel.text!)
            acceleration.becomeFirstResponder()
        }
        if textField == acceleration {
            ax = Double(acceleration.text!)
            acceleration.resignFirstResponder()
        }
        return true
    }
    
    func quad(a: Double, b: Double, c: Double) -> (timeOne: Double, timeTwo: Double) {
        let firstTime = (-b + sqrt((b * b) - (4 * a * c))) / (2 * a)
        let secondTime = (-b - sqrt((b * b) - (4 * a * c))) / (2 * a)
        return (firstTime, secondTime)
    }
    
    @IBAction func calculateTime(sender: AnyObject) {
        if ax > 0 {
            let first = quad((ax / 2), b: vxo, c: (xo - x)).timeOne
            let second = quad((ax / 2), b: vxo, c: (xo - x)).timeTwo
            timeLabel.text = "Time: \(first) or \(second) seconds."
        } else {
            let time = (x - xo) / vxo
            timeLabel.text = "Time: \(time) seconds."
        }
        
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

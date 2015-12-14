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
    @IBOutlet weak var initialVel: UITextField!
    @IBOutlet weak var angle: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var vo: Double!
    var xo: Double!
    var yo: Double!
    var theda: Double!
    var t: Double!

    override func viewDidLoad() {
        super.viewDidLoad()
        initialXPos.delegate = self
        initialYPos.delegate = self
        initialVel.delegate = self
        angle.delegate = self
        time.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == initialXPos {
            xo = Double(initialXPos.text!)
            initialYPos.becomeFirstResponder()
        }
        if textField == initialYPos {
            yo = Double(initialYPos.text!)
            initialVel.becomeFirstResponder()
        }
        if textField == initialVel {
            vo = Double(initialVel.text!)
            angle.becomeFirstResponder()
        }
        if textField == angle {
            theda = Double(angle.text!)! * (M_PI / 180)
            time.becomeFirstResponder()
        }
        if textField == time {
            t = Double(time.text!)
            time.resignFirstResponder()
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func calculatePosition(sender: AnyObject) {
        let height: Double = yo + ((sin(theda) * vo) * t) - (4.9 * (t * t))
        let distance: Double = xo + ((cos(theda) * vo) * t)
        heightLabel.text = "Height: \(height)"
        distanceLabel.text = "Distance: \(distance)"
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


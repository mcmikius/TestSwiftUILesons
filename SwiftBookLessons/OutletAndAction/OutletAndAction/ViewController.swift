//
//  ViewController.swift
//  OutletAndAction
//
//  Created by Michail Bondarenko on 1/23/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func changeTextInLabel(_ sender: UIButton) {
        label.text = "Hello World!"
    }
    @IBAction func sayInConsol(_ sender: UIButton) {
        print("Hello, World! in the consol!")
    }
    
}


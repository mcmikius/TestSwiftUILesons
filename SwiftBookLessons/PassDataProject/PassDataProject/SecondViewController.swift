//
//  SecondViewController.swift
//  PassDataProject
//
//  Created by Michail Bondarenko on 1/24/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import UIKit

class SecondViewController: ViewController {

    var login: String!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func sendPressed(button: UIButton) {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let login = login else { return }
        
        label.text = "Hello, \(login)"
    }

}

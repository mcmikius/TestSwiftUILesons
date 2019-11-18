//
//  ViewController.swift
//  PassDataProject
//
//  Created by Michail Bondarenko on 1/24/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var returnLabel: UILabel!
    
    @IBAction func sendPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    @IBAction func unwindToMainScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        guard let sourceViewController = segue.source as? SecondViewController else { return }
        self.returnLabel.text = sourceViewController.label.text
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? SecondViewController else { return }
        destinationViewController.login = loginTextField.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}


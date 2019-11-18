//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Michail Bondarenko on 1/24/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var monthTextField: UITextField!
    
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findWeekday(_ sender: UIButton) {
        
        let calendar = Calendar.current
        
        var dateComponents = DateComponents()
        guard let day = dateTextField.text, let month = monthTextField.text, let year = yearTextField.text else { return }
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE"
        
        let weekday = dateFormatter.string(from: date)
        
        resultLabel.text = weekday
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


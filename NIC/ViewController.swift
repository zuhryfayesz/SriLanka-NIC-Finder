//
//  ViewController.swift
//  NIC
//
//  Created by Zuhry Fayesz on 12/21/16.
//  Copyright © 2016 Zuhry Fayesz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nicLabel: UILabel!
    @IBOutlet weak var nicText: UITextField!
    @IBOutlet weak var currentDate: UILabel!
    
    // Find NIC details button action
    @IBAction func nic(_ sender: UIButton) {
        
        let nicValue = nicText.text!
        let nic = NIC()
        let daymonth = nic.getMyDayMonth(myDay: nic.getDays(nic: nicValue))
        print("Age   :", nic.getAge(nic: nicValue))
        print("Gender:", nic.getGender(nic: nicValue))
        print("Day   :", daymonth[1])
        print("Month :", daymonth[0])
        print("Year  :", nic.getYear(nic: nicValue))
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Load a custom background image
        let background  = UIImageView(frame: UIScreen.main.bounds)
        background.image = UIImage(named: "wooden.jpg")
        self.view.insertSubview(background, at: 0)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        view.addGestureRecognizer(tap)
        
    }
    
    func doubleTapped() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


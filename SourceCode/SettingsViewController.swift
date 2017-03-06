//
//  SettingsViewController.swift
//  TipComputer
//
//  Created by Ratul Bhawal on 3/1/17.
//  Copyright © 2017 Ratul Bhawal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var SettingsLabel: UILabel!

    @IBOutlet weak var tipControl1: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tipPercentages = [18,20,25]
        let defaults = UserDefaults.standard
        let val = defaults.integer(forKey: "defaultTip");
        //print(val)
        
        SettingsLabel.text = String(format: "Default Tip Percentage : %d %%",tipPercentages[val])
        tipControl1.selectedSegmentIndex = val
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveSettings(_ sender: AnyObject) {
        let tipPercentages = [18,20,25]
        let index = tipControl1.selectedSegmentIndex
        //print(index)
        let defaults = UserDefaults.standard
        defaults.set(index, forKey:"defaultTip")
        defaults.synchronize()
        SettingsLabel.text = String(format: "Default Tip Percentage : %d %%",tipPercentages[index])
    }

    /*@IBAction func saveSettings(_ sender: AnyObject) {
     
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

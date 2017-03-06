//
//  ViewController.swift
//  TipComputer
//
//  Created by Ratul Bhawal on 3/1/17.
//  Copyright © 2017 Ratul Bhawal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipController: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
         view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18,0.20,0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipController.selectedSegmentIndex];
        let total = bill + tip;
        
        
        getFormattedCurrencyString(d:tip,l: tipLabel);
        getFormattedCurrencyString(d: total, l: totalLabel);

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let val = defaults.integer(forKey: "defaultTip");
        tipController.selectedSegmentIndex = val;
        calculateTip(tipController);
        
        self.billField.becomeFirstResponder();
        
        
        
    }
    
    func getFormattedCurrencyString(d: Double, l:UILabel!)
    {
        let currentLocal = NSLocale.current
    
        let numFormatter = NumberFormatter.init();
        numFormatter.currencySymbol = currentLocal.currencySymbol!;
        numFormatter.locale = currentLocal;
        numFormatter.numberStyle = NumberFormatter.Style.currency;
        let dNSNumber: NSNumber = NSNumber(value: d);
        let formatterTipValue = numFormatter.string(from: dNSNumber );
        l.text = formatterTipValue!;
    }
    
    
}


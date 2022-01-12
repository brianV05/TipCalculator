//
//  ViewController.swift
//  Prework
//
//  Created by Brian Velecela on 1/3/22.
//

import UIKit

let defaults = UserDefaults.standard    //global var for the SettingsViewController and ViewController to use
class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var eachPersonAmountLabel: UILabel!
    
    //main
    override func viewDidLoad() {
        overrideUserInterfaceStyle = .light //as default set main to light
        super.viewDidLoad()
        self.title = "Tip Calculator"       //set the title in the nagivator bar
    }
    
    var total:Double = 0 //global variable
    //convert this into a func, for other func to access it
    
    func calculateBill(){
        //get bill amount from the text input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let first:Double = Double(tipControl.titleForSegment(at: 0)!)!
        let second:Double = Double(tipControl.titleForSegment(at: 1)!)!
        let third:Double = Double(tipControl.titleForSegment(at: 2)!)!
        
        //get tottal tip by multiplying tip * percentage
        let tipPercentages = [first / 100, second / 100, third / 100]
        
        let tip = bill * Double(tipPercentages[tipControl.selectedSegmentIndex])
        total = bill + tip
        
        //formatting the tio amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //formatting the total label
        totalLabel.text = String(format: "$%.2f", total)
        updateUI()
    }
     
    //updating the UI as you enter billa amount 
    func updateUI() {
        totalLabel.text = String(format: "$%0.2f",total)
        let numberOfPeople:Int = Int(numberOfPeopleSlider.value)
        eachPersonAmountLabel.text = String(format: "$%0.2f",total / Double(numberOfPeople))
    }
    
    //---------------------------------------------------------------------------------------------------
    
    //view will appear, with this code
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        // For User defaults
        //get defaults
        if defaults.integer(forKey: "tip_1") != 0{
            let tip_1 = defaults.integer(forKey: "tip_1")
            tipControl.setTitle(String(tip_1), forSegmentAt: 0)
        }
            
            else{
                tipControl.setTitle(String(5), forSegmentAt: 0)
            
            }
        
        if defaults.integer(forKey: "tip_2") != 0{
            let tip_2 = defaults.integer(forKey: "tip_2")
            tipControl.setTitle(String(tip_2), forSegmentAt: 1)
        }
            else{
                tipControl.setTitle(String(10), forSegmentAt: 1)
                
            }
        
        if defaults.integer(forKey: "tip_3") != 0{
            let tip_3 = defaults.integer(forKey: "tip_3")
            tipControl.setTitle(String(tip_3), forSegmentAt: 2)
        }
            else{
                tipControl.setTitle(String(15), forSegmentAt: 2)
                
            }
        
        
        //calling data back in type bool if darkModeController.isOn true
        if defaults.bool(forKey:"darkMode") == true{
            overrideUserInterfaceStyle = .dark
        }
        else{
            overrideUserInterfaceStyle = .light
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billAmountTextField.becomeFirstResponder()  //ketboard will appear when launching the app
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    //--------------------------------------------------------------------------------------------------------
    
    //this action is given to show the amount of people being shared(shared: 1)
    @IBAction func numberOfPeopleSliderValueChanged(_ sender: Any) {
        numberOfPeopleLabel.text = "Split: \(Int(numberOfPeopleSlider.value))"
        calculateBill()
    }
    
    //this is the action given to do the calculate func and show in the bill amount label
    @IBAction func billAmountTextFieldChanged(sender: Any){
        calculateBill()
    }
    
    
    //this is the action given to do calculate func as segmented control is selected
    @IBAction func calculateTip(_ sender: Any) {
        calculateBill()
        /*
        //Get the initial bill amount from the text field
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Calculate the total cost
        //let tipPercentages = [0.15, 0.18, 0.2]
        //let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        //let total = bill + tip
        
        //Update the Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        //update Total amount
        totalLabel.text = String(format: "$%.2f", total)
         */
        
    }
}
 



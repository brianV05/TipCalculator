//
//  SettingsViewController.swift
//  Prework
//
//  Created by Brian Velecela on 1/3/22.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var Tip1Modifier: UITextField!
    @IBOutlet weak var Tip2Modifier: UITextField!
    @IBOutlet weak var Tip3Modifier: UITextField!
    @IBOutlet weak var DarkModeController: UISwitch!
    @IBOutlet weak var saveTip: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light //as default set main to light
        saveTip.layer.cornerRadius = 12
        saveTip.layer.borderWidth = 1
        saveTip.layer.borderColor = UIColor.black.cgColor
        
        self.Tip3Modifier.delegate = self
        self.Tip2Modifier.delegate = self
        self.Tip1Modifier.delegate = self
        
    }
    
    //when it runs, this will appear when excuting code
    override func viewWillAppear(_ animated: Bool) {
        //we are reading data back by setting default.bool(type), and the key to reference to
        DarkModeController.isOn = defaults.bool(forKey: "darkMode")
        if DarkModeController.isOn{
            overrideUserInterfaceStyle = .dark
        }
    }
    
    
    @IBAction func setDefaults(_ sender: Any) {
        //set defaults to values
        //storing     user input
        let tip_1 = Int(Tip1Modifier.text!) ?? 0
        let tip_2 = Int(Tip2Modifier.text!) ?? 0
        let tip_3 = Int(Tip3Modifier.text!) ?? 0
        
        //set values, with keys
        defaults.set(tip_1,forKey:"tip_1")
        defaults.set(tip_2,forKey:"tip_2")
        defaults.set(tip_3,forKey:"tip_3")
        defaults.synchronize()
        
        Tip1Modifier.text = ""
        Tip2Modifier.text = ""
        Tip3Modifier.text = ""
    }
    
    // for the dark/ light mode
    @IBAction func switchDarkMode(_ sender: Any?   ) {
        //we are setting the value of bool to see if swith isOn, with a key
        defaults.set(DarkModeController.isOn, forKey:"darkMode")
        
        //if so, it will be dark. Else it will be light
        //retreiving data back
        if defaults.bool(forKey:"darkMode") == true{
            overrideUserInterfaceStyle = .dark
        }
        else{
            overrideUserInterfaceStyle = .light
        }
        
      }
    
  
    
    
    
    
}



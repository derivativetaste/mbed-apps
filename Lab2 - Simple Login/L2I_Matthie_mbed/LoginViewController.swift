//
//  LoginViewController.swift
//  L2I_Matthie_mbed
//
//  Created by Matthie, Clayton on 9/12/16.
//  Copyright © 2016 SMU. All rights reserved.
//

import UIKit



class LoginViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PassTextField: UITextField!
    @IBOutlet weak var SubmitButton: UIButton!
    @IBOutlet weak var ClearButton: UIButton!
    @IBOutlet weak var DomainPicker: UIPickerView!
    
    
    @IBAction func SubmitButton(sender: AnyObject) {
       //self.performSegueWithIdentifier("showLoginInfo", sender:self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let SV = storyboard.instantiateViewControllerWithIdentifier("didlogin")as! DidLoginViewController
         self.presentViewController(SV, animated: true, completion:nil)
        SV.username = self.UsernameTextField.text
        SV.password = self.PassTextField.text
        SV.domain = self.pickerContent[self.DomainPicker.selectedRowInComponent(0)]
        
    }
    
    let pickerContent = ["Domain1", "Domain2", "Domain3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.DomainPicker.dataSource = self
        self.DomainPicker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return self.pickerContent.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return self.pickerContent[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showLoginInfo"){
            let vc =  segue.destinationViewController as?DidLoginViewController
          //  vc.username = self.UsernameTextField.text
         //   vc.password = self.PassTextField.text
            
            
            //TODO: Create properties in DidLoginViewController to set here for display
        }
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

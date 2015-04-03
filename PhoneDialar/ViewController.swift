//
//  ViewController.swift
//  PhoneDialar
//
//  Created by Owner on 4/3/15.
//  Copyright (c) 2015 Scott Bringe. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DialBtn: UIButton!
    @IBOutlet weak var thePhoneNumber: UITextField!
    @IBOutlet weak var dialedNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.thePhoneNumber.keyboardType = UIKeyboardType.PhonePad
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func doDialNumber(sender: AnyObject) { dialedNumber.text = "URL " + thePhoneNumber.text
        let busPhone = thePhoneNumber.text
        if let url = NSURL(string: "tel://\(busPhone)") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    /*func callSellerPressed (sender: UIButton!){
        var newPhone = ""
        var busPhone = thePhoneNumber.text
        for (var i = 0; i < countElements(busPhone); i++){
            
            var current:Int = i
            switch (busPhone[i]){
            case "0","1","2","3","4","5","6","7","8","9" : newPhone = newPhone + String(busPhone[i])
            default : println("Removed invalid character.")
            }
        }
        
        if  (busPhone.utf16Count > 1){
            
            UIApplication.sharedApplication().openURL(NSURL(string: "tel://" + newPhone)!)
        }
        else{
            let alert = UIAlertView()
            alert.title = "Sorry!"
            alert.message = "Phone number is not available for this business"
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
    } */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


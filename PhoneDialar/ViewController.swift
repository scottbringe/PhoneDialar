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
    }

    @IBAction func doDialNumber(sender: AnyObject) {
        var enteredNumber: NSString = ""
        var validNumber: Bool = false
        enteredNumber = thePhoneNumber.text
        if (enteredNumber.length > 0) {
            if (enteredNumber.length == 7){
                // add 1 + area code
                enteredNumber = "1850" + enteredNumber
                dialedNumber.text = enteredNumber
                validNumber = true
            }
            else if (enteredNumber.length == 10){
                // add 1
                enteredNumber = "1" + enteredNumber
                dialedNumber.text = enteredNumber
                validNumber = true
            }
            else if (enteredNumber.length == 11) {
                // valid phone number length
                dialedNumber.text = enteredNumber
                validNumber = true
            }
            else {
                dialedNumber.text = "Invalid phone number."
                validNumber = false
            }
        
        } else {
            dialedNumber.text = "Please enter a phone number."
            validNumber = false
        }
        if validNumber{
            if doNotCall(dialedNumber.text) {
                dialedNumber.text = "Do not call this number."
            } else {
                //dialedNumber.text = "URL " + thePhoneNumber.text
                let busPhone = thePhoneNumber.text
                if let url = NSURL(string: "tel://\(busPhone)") {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
        }
    }
    
    func doNotCall (phoneNumber: String) -> Bool {
        //let url = NSURL(string: "http://70.167.231.132/CheckPhoneNumber/DoNotCall" + "?" + phoneNumber)
        //let theRequest = NSURLRequest(URL: url!)
        //NSURLConnection.sendAsynchronousRequest(theRequest, queue: nil, completionHandler: { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in if data.length > 0 && error == nil { let response : AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.fromMask(0), error:nil)}})
        
        
        let tf = Int(arc4random_uniform(2))
        if tf == 1 {
            return true
        } else {
            return false
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


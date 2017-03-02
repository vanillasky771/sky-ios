//
//  ViewController.swift
//  Sky
//
//  Created by IOS on 3/2/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var ageTxtFld: UITextField!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var txtFlds: UITextView!
    @IBOutlet weak var maleLbl: UILabel!
    @IBOutlet weak var femaleLbl: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ageTxtFld.isSecureTextEntry = true
        
        //setup done accessory input
        let doneAcc = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        let doneButton = UIButton()
        doneButton.setTitle("Done", for: .normal)
        doneButton.sizeToFit()
        doneButton.frame.origin = CGPoint(x: view.frame.width - doneButton.frame.width - 16, y: (44 - doneButton.frame.height) / 2)
        doneAcc.backgroundColor = .gray
        doneButton.addTarget(self, action: #selector(DoneAccessoryTapped), for: .touchUpInside)
        
        //add to keyboard
        doneAcc.addSubview(doneButton)
        nameTxtFld.inputAccessoryView = doneAcc
        ageTxtFld.inputAccessoryView = doneAcc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func buttonClicked(_ sender: Any) {
        print("Hello, Your Username is \(nameTxtFld.text!), Your Password is \(ageTxtFld.text!)")
        
        let al = UIAlertController(title: "Are You Sure ?", message: "Submit for once", preferredStyle: .alert)
        let quest = UIAlertAction(title: "Submit", style: .default, handler: {(e) in
            if(self.switchButton.isOn){
                self.txtFlds.text = "Hello, Your Username is \(self.nameTxtFld.text!), Your Password is \(self.ageTxtFld.text!), and You are Female"
            }
            else{
                self.txtFlds.text = "Hello, Your Username is \(self.nameTxtFld.text!), Your Password is \(self.ageTxtFld.text!), and You are Male"
            }
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "home")
            self.show(homeVC!, sender: nil)
            
            })
        let ok = UIAlertAction(title: "Cancel", style:
            .default, handler: {(e) in print("OK")})
        al.addAction(quest)
        al.addAction(ok)
        self.present(al, animated:true, completion: {(e) in print("Submitted")})
    }
    
    func DoneAccessoryTapped() {
        view.endEditing(true)
    }
    
    
}


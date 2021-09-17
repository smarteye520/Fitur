//
//  Confirm6ViewController.swift
//  Fitur10
//
//  Created by smarteye on 2/4/19.
//  Copyright © 2019 NiKon. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding

class Confirm6ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tfPasword: UITextField!
    @IBOutlet var avoidingView: UIView!
    @IBOutlet weak var svConfirm: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boolVisibility = false
        KeyboardAvoiding.avoidingView = self.avoidingView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfPasword.text = ""
        boolVisibility = false
        super.viewWillAppear(animated)
    }
    @IBAction func onClickbtnBack(_ sender: Any) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickbtnVisibility(_ sender: Any) {
        if boolVisibility {
            tfPasword.isSecureTextEntry = true
        } else {
            tfPasword.isSecureTextEntry = false
        }
        boolVisibility = !boolVisibility
    }
    
    @IBAction func onClickbtnBayar(_ sender: Any) {
        let succesVC = storyboard?.instantiateViewController(withIdentifier: String(describing: Success2ViewController.self)) as! Success2ViewController
        navigationController?.pushViewController(succesVC, animated: false)
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == self.tfPasword {
            KeyboardAvoiding.avoidingView = self.avoidingView
        }
        return true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.tfPasword {
            textField.resignFirstResponder()
        }
//        svConfirm.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        return true
    }

}

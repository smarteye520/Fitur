//
//  InsertData1ViewController.swift
//  Fitur10
//
//  Created by smarteye on 1/31/19.
//  Copyright © 2019 NiKon. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding
//import BottomPopup

let Lpadding:CGFloat = 20;
let Rpadding:CGFloat = 20;
let Spadding:CGFloat = 3;

class InsertData1ViewController: UIViewController, UITextFieldDelegate, SwipeViewDataSource, SwipeViewDelegate{ //, ContactsViewControllerDelegate
    
    @IBOutlet weak var swipeView: SwipeView!
    @IBOutlet weak var tfJenisLayanan: UITextField!
    @IBOutlet weak var tfInstitusi: UITextField!
    @IBOutlet weak var tfKodeBayar: UITextField!
    
//    @IBOutlet weak var lblJenis: UILabel!
    @IBOutlet weak var btnSelanjutnya: UIButton!
    
    @IBOutlet var avoidingView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        KeyboardAvoiding.avoidingView = self.avoidingView
        
        // Custom Textfield
//        lblJenis.text = ""
        tfJenisLayanan.text = ""
        tfJenisLayanan.delegate = self
        tfInstitusi.text = ""
        tfInstitusi.delegate = self
        tfKodeBayar.text = ""
        tfKodeBayar.delegate = self
        btnSelanjutnya.isEnabled = false
        btnSelanjutnya.setBackgroundImage(UIImage(named: "btn-background-disable.png"), for: UIControl.State.normal)
        
        initSwipeView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let length = max(max(tfJenisLayanan.text!.count, tfInstitusi.text!.count), tfKodeBayar.text!.count)
        showSelanjutnya(iLength: length)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tfJenisLayanan.text = ""
        tfInstitusi.text = ""
        tfKodeBayar.text = ""
        btnSelanjutnya.isEnabled = false
        btnSelanjutnya.setBackgroundImage(UIImage(named: "btn-background-disable.png"), for: UIControl.State.normal)
        super.viewDidDisappear(animated)
    }
    
    @IBAction func onClickbtnBack(_ sender: Any) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
//    @IBAction func onClickbtnPopup(_ sender: Any) {
//
//        guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "PopUpVC") as? PopUpViewController else { return }
//        popupVC.height = 262
//        popupVC.topCornerRadius = 10
//        popupVC.presentDuration = 0.5
//        popupVC.dismissDuration = 0.3
//        popupVC.shouldDismissInteractivelty = true
//        popupVC.popupDelegate = self
//        present(popupVC, animated: true, completion: nil)
//    }
    
//    @IBAction func onClickbtnKontak(_ sender: Any) {
//        let contactVC = storyboard?.instantiateViewController(withIdentifier: String(describing: ContactsViewController.self)) as! ContactsViewController
//        contactVC.delegate = self
//        navigationController?.pushViewController(contactVC, animated: false)
//    }
    
    @IBAction func onClickbtnSelanjutnya(_ sender: Any) {
//        lblJenis.text = ""
        let confirmVC = storyboard?.instantiateViewController(withIdentifier: String(describing: Confirm1ViewController.self)) as! Confirm1ViewController
        navigationController?.pushViewController(confirmVC, animated: false)
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if (textField == self.tfJenisLayanan || textField == self.tfInstitusi || textField == self.tfKodeBayar) {
            KeyboardAvoiding.avoidingView = self.avoidingView
        } else {
            KeyboardAvoiding.avoidingView = self.avoidingView
        }
        return true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField == self.tfJenisLayanan || textField == self.tfInstitusi || textField == self.tfKodeBayar) {
            let length = textField.text!.count + string.count - range.length
            showSelanjutnya( iLength: length )
        }
        return true
    }
    
    func showSelanjutnya (iLength: Int)
    {
        if iLength == 0 {
            btnSelanjutnya.setBackgroundImage(UIImage(named: "btn-background-disable.png"), for: UIControl.State.normal)
            btnSelanjutnya.isEnabled = false
        }else{
            btnSelanjutnya.setBackgroundImage(UIImage(named: "successbtn-background.png"), for: UIControl.State.normal)
            btnSelanjutnya.isEnabled = true
        }
    }
    
    /*******************
     // Swipe view
     ********************/
    func initSwipeView() {
        swipeView.alignment = .edge
        swipeView.isPagingEnabled = true
        swipeView.itemsPerPage = 1
        swipeView.truncateFinalPage = true
        
        swipeView.delegate = self
        swipeView.dataSource = self
    }
    
    // SwipeView datasource
    func numberOfItems(in swipeView: SwipeView!) -> Int {
        return 3
    }
    
    func swipeView(_ swipeView: SwipeView!, viewForItemAt index: Int, reusing view: UIView!) -> UIView! {
        
        let width  = CGFloat(UIScreen.main.bounds.width)
        let height = CGFloat(41)
        
        if view == nil {
            let bankView = Bundle.main.loadNibNamed("BankView", owner: self, options: nil)?[0] as? BankView
            
            var frame = bankView?.frame
            let width = width - Lpadding - Rpadding + Spadding
            
            frame?.size.width = CGFloat(width)
            frame?.size.height = height
            
            bankView?.frame = frame!
            bankView?.setNeedsLayout()
            
            return bankView
        }
        
        return view
    }
    /*
    // MARK: ContactsTableViewController delegate
    
    func didTapContactsController(contact: Contact) {
        let fullname = contact.givenName + " " + contact.familyName
        /////Code here which textfield
        tfJenisLayanan.text = fullname
        
        //        let phoneNumber = contact.phoneNumber
        //        if phoneNumber.count > 0 {
        //            txtContactPhoneNumber.text = phoneNumber
        //
        //            if strAreaCode != "Kode Area" {
        //                if transactionMenuId == 0 {
        //                    showScrollView()
        //                } else {
        //                    showBillingView()
        //                }
        //            }
        //        }
    }
    */
}


//extension InsertData1ViewController: BottomPopupDelegate {
//
//    func bottomPopupViewLoaded() {
//        print("bottomPopupViewLoaded")
//    }
//
//    func bottomPopupWillAppear() {
//        print("bottomPopupWillAppear")
//    }
//
//    func bottomPopupDidAppear() {
//        print("bottomPopupDidAppear")
//    }
//
//    func bottomPopupWillDismiss() {
//        print("bottomPopupWillDismiss")
//        self.lblJenis.text = strJenis
//    }
//
//    func bottomPopupDidDismiss() {
//        print("bottomPopupDidDismiss")
//    }
//
//    func bottomPopupDismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat) {
//        print("bottomPopupDismissInteractionPercentChanged fromValue: \(oldValue) to: \(newValue)")
//    }
//}


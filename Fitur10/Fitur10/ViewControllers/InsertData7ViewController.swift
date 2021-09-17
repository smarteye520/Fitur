//
//  InsertData7ViewController.swift
//  Fitur10
//
//  Created by smarteye on 2/5/19.
//  Copyright © 2019 NiKon. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding
import BottomPopup

class InsertData7ViewController: UIViewController, UITextFieldDelegate, SwipeViewDataSource, SwipeViewDelegate { //}, ContactsViewControllerDelegate{
    
    @IBOutlet weak var swipeView: SwipeView!
    
//    @IBOutlet weak var lblJenis: UILabel!
    @IBOutlet weak var tfNegaraTujuan: UITextField!
    @IBOutlet weak var tfJangkaWaktu: UITextField!
    @IBOutlet weak var btnSelanjutnya: UIButton!
    
    @IBOutlet var avoidingView: UIView!
    
    var bCheckBox: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        KeyboardAvoiding.avoidingView = self.avoidingView
        
        // Custom Textfield
        tfNegaraTujuan.text = ""
        tfNegaraTujuan.delegate = self
        tfJangkaWaktu.text = ""
        tfJangkaWaktu.delegate = self
        btnSelanjutnya.isEnabled = false
        btnSelanjutnya.setBackgroundImage(UIImage(named: "btn-background-disable.png"), for: UIControl.State.normal)
        
        initSwipeView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        let length = tfNik.text!.count
        showSelanjutnya()
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tfNegaraTujuan.text = ""
        tfJangkaWaktu.text = ""
        btnSelanjutnya.isEnabled = false
        btnSelanjutnya.setBackgroundImage(UIImage(named: "btn-background-disable.png"), for: UIControl.State.normal)
        super.viewWillAppear(animated)
    }
    
    
    @IBAction func onClickbtnBack(_ sender: Any) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
//    @IBAction func onClickbtnPopup1(_ sender: UIButton) {
//        bCheckJenisLayanan = true
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
//
//    @IBAction func onClickbtnPopup2(_ sender: UIButton) {
//        bCheckJenisLayanan = false
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
//
//    @IBAction func onClickbtnKontak(_ sender: Any) {
//        let contactVC = storyboard?.instantiateViewController(withIdentifier: String(describing: ContactsViewController.self)) as! ContactsViewController
//        contactVC.delegate = self
//        navigationController?.pushViewController(contactVC, animated: false)
//    }
    
    @IBAction func onClickbtnCalendar(_ sender: Any) {
        /////Code here! Calendar
    }
    
    @IBAction func onClickbtnSelanjutnya(_ sender: Any) {
//        lblJenisBulan.text = ""
        let confirmVC = storyboard?.instantiateViewController(withIdentifier: String(describing: Confirm7ViewController.self)) as! Confirm7ViewController
        navigationController?.pushViewController(confirmVC, animated: false)
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if (textField == self.tfNegaraTujuan || textField == self.tfJangkaWaktu) {
            KeyboardAvoiding.avoidingView = self.avoidingView
        }
        return true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == self.tfJangkaWaktu {
//            let length = textField.text!.count + string.count - range.length
//
//            showSelanjutnya( iLength: length )
        }
        return true
    }
    
    func showSelanjutnya ()
    {
        if bCheckBox == false {
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
    
    // MARK: ContactsTableViewController delegate
    /*
    func didTapContactsController(contact: Contact) {
        let fullname = contact.givenName + " " + contact.familyName
        tfJangkaWaktu.text = fullname
        
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

/*
extension InsertData7ViewController: BottomPopupDelegate {
    
    func bottomPopupViewLoaded() {
        print("bottomPopupViewLoaded")
    }
    
    func bottomPopupWillAppear() {
        print("bottomPopupWillAppear")
    }
    
    func bottomPopupDidAppear() {
        print("bottomPopupDidAppear")
    }
    
    func bottomPopupWillDismiss() {
        print("bottomPopupWillDismiss")
        if bCheckJenisLayanan {
            self.lblJenis.text = strJenis
        } else {
            self.lblJenisBulan.text = strJenis
        }
    }
    
    func bottomPopupDidDismiss() {
        print("bottomPopupDidDismiss")
    }
    
    func bottomPopupDismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat) {
        print("bottomPopupDismissInteractionPercentChanged fromValue: \(oldValue) to: \(newValue)")
    }
}
*/

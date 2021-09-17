//
//  ContactsViewController.swift
//  Fitur7
//
//  Created by smarteye on 2/8/19.
//  Copyright © 2019 Nikon. All rights reserved.
//

import UIKit
import SwiftyContacts

protocol ContactsViewControllerDelegate: class {
    func didTapContactsController(contact: Contact);
}

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvContacts: UITableView!
    
    var contactList = [Contact]()
    weak var delegate: ContactsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tvContacts.dataSource = self
        tvContacts.delegate = self
        getContacts()
    }
    
    @IBAction func onClickbtnBack(_ sender: Any) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
        
    func getContacts() {
        
        requestAccess { (responce) in
            if responce{
                print("Contacts Acess Granted")
            } else {
                print("Contacts Acess Denied")
            }
        }
        
        authorizationStatus { (status) in
            switch status {
            case .authorized:
                print("authorized")
                break
            case .denied:
                print("denied")
                break
            default:
                break
            }
        }
        
        fetchContacts(ContactsSortorder: .givenName, completionHandler: { (result) in
            switch result{
            case .Success(response: let contacts):
                // Do your thing here with [CNContacts] array
                
                for con in contacts {
                    let contact = Contact()
                    
                    let givenName = con.givenName
                    let familyName = con.familyName
                    var phoneNumber = ""
                    if con.phoneNumbers.count > 0 {
                        phoneNumber = con.phoneNumbers[0].value.stringValue
                        
                        phoneNumber = phoneNumber.replacingOccurrences(of: "(", with: "")
                        phoneNumber = phoneNumber.replacingOccurrences(of: ")", with: "")
                        phoneNumber = phoneNumber.replacingOccurrences(of: "-", with: "")
                        phoneNumber = phoneNumber.replacingOccurrences(of: "*", with: "")
                        phoneNumber = phoneNumber.replacingOccurrences(of: " ", with: "")
                    }
                    
                    contact.givenName = givenName
                    contact.familyName = familyName
                    contact.phoneNumber = phoneNumber
                    
                    self.contactList.append(contact)
                }
                
                break
            case .Error(error: let error):
                print(error)
                break
            }
        })
        
    }
    
     // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactcell") as! ContactTableViewCell
        // Configure the cell...
        cell.setInfo(contact: contactList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didTapContactsController(contact: contactList[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.popViewController(animated: true)
    }
}



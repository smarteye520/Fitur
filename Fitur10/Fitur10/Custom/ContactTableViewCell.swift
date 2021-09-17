//
//  ContactTableViewCell.swift
//  MobileBaninking
//
//  Created by Loyal Lauzier on 2019/01/22.
//  Copyright © 2019 Ibrahim Aghythara. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInfo(contact: Contact) -> Void {
        lblName.text = contact.givenName + " " + contact.familyName
        lblPhoneNumber.text = contact.phoneNumber
    }
    
}

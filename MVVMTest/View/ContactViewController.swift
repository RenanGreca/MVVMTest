//
//  ContactViewController.swift
//  MVVMTest
//
//  Created by Renan Greca on 26/07/18.
//  Copyright © 2018 renangreca. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    
    var contact: ContactViewModel!
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var birthday: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = contact.fullName
        self.email.text = contact.email
        self.phoneNumber.text = contact.phoneNumber
        self.birthday.text = contact.birthdayText

    }

}

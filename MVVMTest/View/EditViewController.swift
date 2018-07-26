//
//  EditViewController.swift
//  MVVMTest
//
//  Created by Renan Greca on 26/07/18.
//  Copyright © 2018 renangreca. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var firstName: TextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var birthday: UIDatePicker!
    
    var contact = ContactViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.populate()
        
    }
    
    @IBAction func datePickerDidEndEditing(_ sender: Any) {
        contact.birthday = birthday.date
    }
    
    func populate() {
        firstName.delegate = self
        firstName.text = contact.firstName
        
        lastName.delegate = self
        lastName.text = contact.lastName
        
        email.delegate = self
        email.text = contact.email
        
        phoneNumber.delegate = self
        phoneNumber.text = contact.phoneNumber
        
        birthday.date = contact.birthday ?? Date()
    }
}

extension EditViewController: UITextFieldDelegate {
    
    enum TextFieldContentType: String {
        case firstName
        case lastName
        case email
        case phoneNumber
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let label = textField.accessibilityLabel,
              let contentType = TextFieldContentType(rawValue: label) else {
            return
        }
        
        switch contentType {
        case .firstName:
            contact.firstName = textField.text
        case .lastName:
            contact.lastName = textField.text
        case .email:
            contact.email = textField.text
        case .phoneNumber:
            contact.phoneNumber = textField.text
        }
    }
    
}

extension EditViewController {
    
    
}

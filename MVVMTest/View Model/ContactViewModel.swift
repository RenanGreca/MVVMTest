//
//  ContactViewModel.swift
//  MVVMTest
//
//  Created by Renan Greca on 26/07/18.
//  Copyright © 2018 renangreca. All rights reserved.
//

import Foundation

class ContactViewModel: ViewModel {
    
    var contact: Contact
    
    var firstName: String? {
        get {
            return self.contact.firstName
        }
        set {
           self.contact.firstName = newValue
        }
    }
    
    var lastName: String? {
        get {
            return self.contact.lastName
        }
        set {
            self.contact.lastName = newValue
        }
    }
    
    var email: String? {
        get {
            return self.contact.email
        }
        set {
            self.contact.email = newValue
        }
    }
    
    var phoneNumber: String? {
        get {
            return self.contact.phoneNumber
        }
        set {
            self.contact.phoneNumber = newValue
        }
    }
    
    var birthday: Date? {
        get {
            return self.contact.birthday
        }
        set {
            self.contact.birthday = newValue
        }
    }
    
    var fullName: String {
        return "\(contact.firstName ?? "") \(contact.lastName ?? "")".trimmingCharacters(in: .whitespaces)
    }
    
    var birthdayText: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        if let birthday = contact.birthday {
            return dateFormatter.string(from: birthday)
        } else {
            return nil
        }
    }
    
    init() {
        self.contact = Contact()
    }
    
}

//
//  ListViewModel.swift
//  MVVMTest
//
//  Created by Renan Greca on 26/07/18.
//  Copyright © 2018 renangreca. All rights reserved.
//

import Foundation

struct ContactListViewModel: ViewModel {
 
    private var contacts: [ContactViewModel]
    
    var count: Int {
        return contacts.count
    }
    
    subscript(index: Int) -> ContactViewModel {
        return contacts[index]
    }
    
    mutating func append(_ item: ContactViewModel) {
        contacts.append(item)
    }
    
    init() {
        contacts = []
    }
    
}

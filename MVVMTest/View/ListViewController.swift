//
//  ListViewController.swift
//  MVVMTest
//
//  Created by Renan Greca on 26/07/18.
//  Copyright © 2018 renangreca. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    var contacts = ContactListViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let editViewController = segue.destination as? EditViewController {
            let contact = ContactViewModel()
            contacts.append(contact)
            editViewController.contact = contact
        }
        
        if let contactViewController = segue.destination as? ContactViewController {
            if let selected = tableView.indexPathForSelectedRow {
                let contact = contacts[selected.row]
                contactViewController.contact = contact
            } else {
                return
            }
        }
        
        super.prepare(for: segue, sender: sender)
    }

}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = contacts[indexPath.row].fullName
        
        return cell
    }
    
}

//extension ListViewController: UITableViewDelegate {
//
//}


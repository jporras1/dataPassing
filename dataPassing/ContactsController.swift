//
//  ContactsController.swift
//  dataPassing
//
//  Created by Javier Porras jr on 10/20/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ContactsController: UITableViewController {
    //MARK: Properties
    var contacts = [Contact]()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Contacts"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddContact))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        view.backgroundColor = .white
    }
    
    
    //MARK: Handlers
    @objc func handleAddContact(){
        print("Did select add button")
        let controller = AddContactsController()
        controller.delegate = self
        
        self.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
    
    //MARK: UITableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].fullName
        return cell
    }

}

struct Contact {
    var fullName: String
}

extension ContactsController: AddContactDelegate{
    func add(_ contact: Contact) {
        self.dismiss(animated: true) {
            self.contacts.append(contact)
            self.tableView.reloadData()
        }
    }
    
}

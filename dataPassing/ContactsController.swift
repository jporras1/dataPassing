//
//  ContactsController.swift
//  dataPassing
//
//  Created by Javier Porras jr on 10/20/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

class ContactsController: UITableViewController {
    //MARK: Properties
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Contacts"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddContact))
        
        view.backgroundColor = .white
    }
    
    
    //MARK: Handlers
    @objc func handleAddContact(){
        print("Did select add button")
        self.present(UINavigationController(rootViewController: AddContactsController()), animated: true, completion: nil)
    }

}

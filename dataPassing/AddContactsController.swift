//
//  ViewController.swift
//  dataPassing
//
//  Created by Javier Porras jr on 10/20/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

class AddContactsController: UIViewController {
    //MARK: Properties
    var delegate: AddContactDelegate?
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Full Name"
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didHandleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didHandleDone))
        
        //Code For autolayout of textfield
        view.addSubview(textField)
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        
        textField.becomeFirstResponder()
    }

    //MARK: Handlers
    @objc func didHandleCancel(){
        print("Did hit cancel")
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didHandleDone(){
        guard let fullname = textField.text, textField.hasText else {
            print("Did hit DONE")
            return
        }
        let contact = Contact(fullName: fullname)
        print(contact.fullName)
        delegate?.add(contact)
    }

}

protocol AddContactDelegate {
    func add(_ contact: Contact)
}

extension AddContactsController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // don't force `endEditing` if you want to be asked for resigning
        // also return real flow value, not strict, like: true / false
        //self.didHandleDone()
        return true //textField.endEditing(false)
    }
}

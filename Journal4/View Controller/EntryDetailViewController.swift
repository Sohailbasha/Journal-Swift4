//
//  EntryDetailViewController.swift
//  Journal4
//
//  Created by Ilias Basha on 7/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit
import CoreData

class EntryDetailViewController: UIViewController {
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViewWith()
    }
    
    // Outlets
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var bodyTextField: UITextView!
    
    
    
    func updateViewWith() {
        guard let entry = entry else { return }
            titleTextField.text = entry.title
            bodyTextField.text = entry.bodyText
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let title = titleTextField.text, !title.isEmpty, let bodyText = bodyTextField.text, !bodyText.isEmpty {
            if let entry = entry {
                entry.title = title
                entry.bodyText = bodyText
                entry.timeStamp = Date()
            } else {
                guard let newEntry = Entry(title: title, bodyText: bodyText, timeStamp: Date()) else { return }
                EntryController.sharedInstance.create(newEntry)
                entry = newEntry
            }
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextField.text = ""
    }
    
}


























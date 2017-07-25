//
//  EntryDetailViewController.swift
//  Journal4
//
//  Created by Ilias Basha on 7/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Outlets
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var bodyTextField: UITextView!
    
    
    
    
    var entry: Entry? {
        didSet {
            if let entry = entry {
                updateViewWith(entry)
            }
        }
    }
    
    
    func updateViewWith(_ entry: Entry) {
        titleTextField.text = entry.title
        bodyTextField.text = entry.bodyText
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let entry = entry {
            
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextField.text = ""
    }
    
}

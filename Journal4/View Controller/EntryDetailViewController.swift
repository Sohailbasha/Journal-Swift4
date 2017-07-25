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
    
    var entry: Entry? {
        didSet {
            updateView()
        }
    }
    
    
    func updateView() {
        
    }
    
}

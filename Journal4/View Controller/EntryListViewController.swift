//
//  EntryListViewController.swift
//  Journal4
//
//  Created by Ilias Basha on 7/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit
import CoreData

class EntryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    // OUTLETS
    @IBOutlet var tableView: UITableView!
    
    // PROPERTIES
    
    let fetchedResultsController: NSFetchedResultsController<Entry> = {
        // 1 create fetchRequest
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        
        // 2 create sort descriptors
        let sortDescriptor = NSSortDescriptor(key: "timeStamp", ascending: false)
        
        // 3 assign sort descriptors to the fetch request
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // 4 create and return the fetched results controller using our fetchRequest and our sort descriptors
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
    }()
    // monitors everything inside of the MOC ^. Communicates with the delegate.
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath) as UITableViewCell
        return cell
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

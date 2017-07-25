//
//  EntryListViewController.swift
//  Journal4
//
//  Created by Ilias Basha on 7/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit
import CoreData

class EntryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("Error starting fetched results controller: \(error)")
        }
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
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath) as UITableViewCell
        let entry = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.bodyText
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let entry = fetchedResultsController.fetchedObjects?[indexPath.row] {
                EntryController.sharedInstance.delete(entry)
            }
        }
    }
    
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEntry" {
            if let destinationVC = segue.destination as? EntryDetailViewController,
                let selectedIndex = tableView.indexPathForSelectedRow {
                let entry = fetchedResultsController.fetchedObjects?[selectedIndex.row]
                destinationVC.entry = entry
            }
        }
    }
}

extension EntryListViewController {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            guard let indexPath = indexPath else {return}
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        case .insert:
            guard let newIndexPath = newIndexPath else {return}
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        case .move:
            guard let indexPath = indexPath, let newIndexPath = newIndexPath else {return}
            tableView.moveRow(at: indexPath, to: newIndexPath)
            
        case .update:
            guard let indexPath = indexPath else {return}
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
}

















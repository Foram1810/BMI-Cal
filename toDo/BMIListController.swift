//
//  BMIListController.swift
//  toDo
//
//  Created by Shubh Patel on 2018-12-14.
//  Copyright © 2018 MAGNUMIUM. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class BMIListController: UITableViewController {
    
    var items = List<Record>()
    
    var realm: Realm!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        setupUI()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func setupUI()  {
        reloadTable()
    }
    
    override func tableView(_ tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reloadTable()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            try! self.realm.write {
                self.realm.delete(self.items[indexPath.row])
            }
            self.reloadTable()
            // tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
       return [delete]
    }

    // MARK: - Table view data source
    
    func reloadTable() {
        self.items.removeAll()
        for item in self.realm.objects(Record.self){
            self.items.append(item)
        }
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController]
        // Pass the selected obiect to the new view controller
        
        if(segue.identifier == "Edit"){
            let tableViewCell = sender as! UITableViewCell
            let indexPath  = tableView.indexPath(for: tableViewCell)!
            let item = self.items[indexPath.row]
            
            let newVC = segue.destination as! SecondViewController
            newVC.title = item.name
            newVC.item = item
            newVC.isSaved = true
            
        }
        
        
    }

}

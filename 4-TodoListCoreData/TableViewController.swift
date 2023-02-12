//
//  TableViewController.swift
//  4-TodoListCoreData
//
//  Created by Mac on 12.02.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = tasks[indexPath.row]

        return cell
    }
    

   
}

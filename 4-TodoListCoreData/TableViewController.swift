//
//  TableViewController.swift
//  4-TodoListCoreData
//
//  Created by Mac on 12.02.2023.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var tasks: [Tasks] = []
    let context = CoreDataManager.instance.context
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = Tasks.fetchRequest()
        do {
            tasks  = try (context.fetch(fetchRequest))
            
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    @IBAction func addTaskAction(_ sender: Any) {
        let alertController = UIAlertController(title: "New task", message: "Enter the task", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            let tf = alertController.textFields?.first
            if let newTask = tf?.text {
                self.saveTask(withTitle: newTask)
                self.tableView.reloadData()
            }
        }
        alertController.addTextField()
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    func saveTask(withTitle title: String) {
        guard let entity  = NSEntityDescription.entity(forEntityName: "Tasks", in: context) else {return}
        let taskObject = Tasks(entity: entity, insertInto: context)
        taskObject.title = title
        tasks.append(taskObject)
        CoreDataManager.instance.saveContext()
    
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
        
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        return cell
    }
    
    
    
}

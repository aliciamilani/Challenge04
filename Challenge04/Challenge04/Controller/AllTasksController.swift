//
//  AllTasksController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 01/09/22.
//

import Foundation
import UIKit
import CoreData

class AllTasksController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: CategoryTypes = .none
    var goal: CategoryTypes = .none
    
    private var taskModel = [TaskModel]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getAllItems()
    }
    
    // Core Data
    
    func getAllItems() {
        do {
            let allData = try context.fetch(TaskModel.fetchRequest())
            
            print(allData.count)
            print(goal.self)
            taskModel = allData.filter { t in
                print("t1: ", t.goal)
                print("t2: ", goal.rawValue)
                return t.goal == goal.rawValue
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch {
            //error
        }
        
    }
    
    func deleteItem(item: TaskModel){
        context.delete(item)
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    func updateItem(item: TaskModel, newTitle: String){
        item.title = newTitle
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    @IBAction func addTasks(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAllTasks", for: indexPath) as! CardCellAllTasks
        
        let task = taskModel[indexPath.row]
        
        cell.configure(currentTitle: task.title!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
            if let destination = segue.destination as? NewTaskViewController {
            
                destination.goal = goal
                destination.category = category
                destination.add = true
            }
        }
        
        if segue.identifier == "editSegue" {
            if let destination = segue.destination as? NewTaskViewController {
                guard let indexPath = tableView.indexPathForSelectedRow else {
                    return
                }
                tableView.deselectRow(at: indexPath, animated: false)
                destination.taskModel = taskModel[indexPath.row]
                destination.add = false
            }
        }
    }
}

class CardCellAllTasks: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    func configure(currentTitle: String){
        title.text = currentTitle
    }
}


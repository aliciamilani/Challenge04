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
    
//    var data = getAllTasks()
    
    var info: [String: String] = ["category" : "", "goal" : ""]
    
    var tasks: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Tasks")
        
        do {
            tasks = try manageContext.fetch(fetchRequest)
        } catch let error as NSError {
            print(error)
        }
    }
    
    @IBAction func addTasks(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "editSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAllTasks", for: indexPath) as! CardCellAllTasks
        
        let task = tasks[indexPath.row]
        
        cell.configure(currentTitle: task.value(forKey: "title") as! String)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let destination = segue.destination as? NewTaskViewController {
          guard let indexPath = tableView.indexPathForSelectedRow else {
              return
          }
          tableView.deselectRow(at: indexPath, animated: false)
          destination.task = tasks[indexPath.row]
      }
    }
}

class CardCellAllTasks: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    func configure(currentTitle: String){
        title.text = currentTitle
    }
}


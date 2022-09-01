//
//  AllTasksController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 01/09/22.
//

import Foundation
import UIKit

class AllTasksController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = getAllTasks()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    
    @IBAction func addTasks(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "editSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAllTasks", for: indexPath) as! CardCellAllTasks
        
        cell.configure(currentTitle: data[indexPath.row].title)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let destination = segue.destination as? NewTaskViewController {
          guard let indexPath = tableView.indexPathForSelectedRow else {return}
          tableView.deselectRow(at: indexPath, animated: false)
          destination.currentTask = data[indexPath.row]
      }
    }
}

class CardCellAllTasks: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    func configure(currentTitle: String){
        title.text = currentTitle
    }
}


//
//  DailyTasksController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import UIKit

class DailyTasksController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var wecolmeMessage: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
        
    var humor = ""
    
    private var taskModel = [TaskModel]()
    private var humorModel = [HumorModel]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            taskModel = getTasksDay(humor: humor)
            
            humorModel = try context.fetch(HumorModel.fetchRequest())
            
            humorModel = humorModel.filter { h in
                return Calendar.current.isDateInToday(h.data!)
            }
            
            self.humor = humorModel[0].humor!
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch {
            //error
        }
        
        dateLabel.text = getCurrentTime()
        messageLabel.text = getMessage(humor: humor)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        cell.configure(title: taskModel[indexPath.row].title!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let latter = UIContextualAction(style: .destructive,
                                       title: "Reschedule") { [weak self] (action, view, completionHandler) in
            guard let self = self else {return}
            
            
            self.taskModel.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
        }
        latter.backgroundColor = UIColor(named: "Undone")
        
        let configuration = UISwipeActionsConfiguration(actions: [latter])
            
        return configuration
    }
    
    func tableView(_ tableView: UITableView,
                       trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let done = UIContextualAction(style: .destructive,
                                       title: "Done") { [weak self] (action, view, completionHandler) in
            guard let self = self else {return}
            
            self.taskModel.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
        }
        done.backgroundColor = UIColor(named: "Done")
        
        let configuration = UISwipeActionsConfiguration(actions: [done])
            
        return configuration
    }
    
    
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = UIColor.init(named: "Card")

    }

    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        if indexPath != nil {
            let cell = tableView.cellForRow(at: indexPath!)
            cell?.contentView.backgroundColor = UIColor.init(named: "Background")
        }
        
    }
    
}

func getCurrentTime() -> String {
    
    let currentLocale:Locale = NSLocale(localeIdentifier: Locale.preferredLanguages.first!) as Locale
    let currentDate =  Date()
    
    let stringDate = currentDate.formatted(.dateTime
                     .day(.twoDigits)
                     .month(.wide)
                     .weekday(.short)
                     .locale(currentLocale))
    
    let thedate = "\(stringDate)"
    return thedate
}



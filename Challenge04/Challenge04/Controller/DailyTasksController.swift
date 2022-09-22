//
//  DailyTasksController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import UIKit
import CoreData

class DailyTasksController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var wecolmeMessage: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
        
    var humor = ""
    
    let userDefaults = UserDefaults.standard
    var listOfTasks: [String] = []
    
    private var taskModel = [TaskModel]()
    private var humorModel = [HumorModel]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDefaults.set(false, forKey: "goalsButton")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getSavedTasks()
        getHumorDay()
    }
    
    func deleteItem(item: TaskModel){
        context.delete(item)
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    func getSavedTasks(){
        
        listOfTasks = userDefaults.object(forKey: "tasks") as? [String] ?? []
        
        for i in 0 ..< listOfTasks.count {
            taskModel.append(context.object(with: context.persistentStoreCoordinator!.managedObjectID(forURIRepresentation: URL(string: listOfTasks[i])!)!) as! TaskModel)
        }
    }
    
    func getHumorDay(){
        do {
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dateLabel.text = getCurrentTime()
        messageLabel.text = getMessage(humor: humor)
        tableView.reloadData()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if taskModel.count == 0 {
            tableView.setEmptyView(title: "Congratulations! You are done for today.", message: "See you tomorrow.")
        } else {
            tableView.restore()
        }
        
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
            
            self.listOfTasks.remove(at: indexPath.row)
            self.userDefaults.set(self.listOfTasks, forKey: "tasks")
            
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
            
            // tem q apagar de tudo
            
            self.deleteItem(item: self.taskModel[indexPath.row])
            self.taskModel.remove(at: indexPath.row)
            
            self.listOfTasks.remove(at: indexPath.row)
            self.userDefaults.set(self.listOfTasks, forKey: "tasks")
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        print("Unwind")
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


extension UITableView {
    func setEmptyView(title: String, message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "Poppins-Light", size: 19)
        titleLabel.textColor = UIColor(named: "Text")
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        // The only tricky part is here:
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

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
    
    var humor: HumorTypes?
    
    let userDefaults = UserDefaults.standard
    var listOfTasks: [String] = []
    
    private var taskModel = [TaskModel]()
    private var humorModel = [HumorModel]()
    private var listAllItems = [TaskModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDefaults.set(false, forKey: "goalsButton")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getHumorDay()
    }
    
    
    func getSavedTasks(){
        listOfTasks = userDefaults.object(forKey: "tasks") as? [String] ?? []
        
        do {
            let allData = try context.fetch(TaskModel.fetchRequest())
            
            listAllItems = allData.filter { t in
                return t.isUrgent == true
            }
            
            for i in listAllItems {
                
                if !listOfTasks.contains(i.objectID.uriRepresentation().absoluteString){
                    listOfTasks.append(i.objectID.uriRepresentation().absoluteString)
                }
            }
            
        } catch {
            fatalError("Unable to get daily tasks.")
        }
        
        taskModel = [TaskModel]()
        
        for i in 0 ..< listOfTasks.count {
            
            let a = context.object(with: context.persistentStoreCoordinator!.managedObjectID(forURIRepresentation: URL(string: listOfTasks[i])!)!) as! TaskModel
            
            if a.title != nil{
                taskModel.append(a)
            }
        }
        
        userDefaults.set(listOfTasks, forKey: "tasks")
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func getHumorDay(){
        do {
            humorModel = try context.fetch(HumorModel.fetchRequest())
            
            humorModel = humorModel.filter { h in
                return Calendar.current.isDateInToday(h.data!)
            }
            
            guard let humorModel = humorModel[0].humor else { return }
            
            self.humor = getHumorFromString(humor: humorModel)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch {
            fatalError("Unable to get daily mood.")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let humor = humor else { return }
        messageLabel.text = getDailyMessage(humor: humor)
        
        dateLabel.text = Date().getFormattedDate()
        
        getSavedTasks()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
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
        
        if !taskModel[indexPath.row].isUrgent {
            
            let latter = UIContextualAction(style: .destructive,
                                            title: "Reschedule") { [weak self] (action, view, completionHandler) in
                guard let self = self else {return}
                
                self.taskModel.remove(at: indexPath.row)
                
                self.listOfTasks.remove(at: indexPath.row)
                self.userDefaults.set(self.listOfTasks, forKey: "tasks")
                
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                self.tableView.reloadData()
            }
            latter.backgroundColor = UIColor.reschedule
            
            return UISwipeActionsConfiguration(actions: [latter])
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let done = UIContextualAction(style: .destructive,
                                      title: "Done") { [weak self] (action, view, completionHandler) in
            guard let self = self else {return}
            
            CoreDataFunctions().deleteTask(item: self.taskModel[indexPath.row])
            self.taskModel.remove(at: indexPath.row)
            
            self.listOfTasks.remove(at: indexPath.row)
            self.userDefaults.set(self.listOfTasks, forKey: "tasks")
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
            
            //            HapticsManager.shared.vibrate(for: .success)
        }
        done.backgroundColor = UIColor.done
        
        return UISwipeActionsConfiguration(actions: [done])
    }
    
    
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = UIColor.card
        
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        if indexPath != nil {
            let cell = tableView.cellForRow(at: indexPath!)
            cell?.contentView.backgroundColor = UIColor.background
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsController {
            
            guard let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
            
            tableView.deselectRow(at: indexPath, animated: false)
            destination.task = taskModel[indexPath.row]
            destination.position = indexPath.row
        }
    }
    
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
        titleLabel.textColor = UIColor.text
        
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
        
        
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}


class CardCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    
    func configure(title: String){
        titleLabel.text = title
        cardView.layer.cornerRadius = 12.0
    }
}

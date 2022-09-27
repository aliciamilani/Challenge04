//
//  DatailsController.swift
//  GoMoo
//
//  Created by Anna Alicia Milani on 21/09/22.
//

import Foundation
import UIKit
import CoreData

class DetailsController: UIViewController{
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var difficultyLabel: UILabel!
    
    @IBOutlet weak var urgencyLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var task = TaskModel()
    var position = 0
    let userDefaults = UserDefaults.standard
    
    func findDuration () -> String {
        if task.duration == 1 {
            return "1 hour"
        } else if task.duration == 2 {
            return "2 hours"
        } else if task.duration == 3 {
            return "3 hours or more"
        }
        
        return ""
    }
    
    func findDifficulty () -> String {
        if task.difficulty == 1 {
            return "easy"
        } else if task.difficulty == 2 {
            return "medium"
        } else if task.difficulty == 3 {
            return "hard"
        }
        
        return ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTitleLabel.text = task.title!
        timerLabel.text = "The duration of this task is " + findDuration()
        difficultyLabel.text = "This task is considered " + findDifficulty()
        urgencyLabel.text = task.urgency ? "There is urgency!" : "There is no urgency."
        
        if (task.descrip != nil && task.descrip != "") {
            descriptionLabel.text = task.descrip
        } else {
            descriptionLabel.text = "There is no description."
            descriptionLabel.textColor = .tertiaryLabel
        }
        
        navigationController?.setToolbarHidden(true, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func deleteItem(item: TaskModel){
        context.delete(item)
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    
    @IBAction func okBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    var listOfTasks: [String] = []
    
    
    func removeElementFromDefaults () {
        listOfTasks = userDefaults.object(forKey: "tasks") as? [String] ?? []
        listOfTasks.remove(at: position)
        userDefaults.set(listOfTasks, forKey: "tasks")
    }
    
    @IBAction func doneBtn(_ sender: UIButton) {
        
        deleteItem(item: task)
        
        removeElementFromDefaults()
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rescheduleBtn(_ sender: UIButton) {
        
        removeElementFromDefaults()
        
        navigationController?.popViewController(animated: true)
    }
}

//
//  NewTaskViewController.swift
//  Challenge04
//
//  Created by Victor Santos on 8/25/22.
//

import Foundation
import UIKit
import CoreData

class NewTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var addTaskButton: UIBarButtonItem!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var taskModel = TaskModel()
    
    var createdTask: LocalTask?
    
    var category: CategoryTypes = .none
    var goal: CategoryTypes = .none
    
    var add = true
    
    struct Options {
        let title: String
        var description: String
    }
    
    var data: [Options] = [
        Options(title: "Difficulty", description: "I don't know >"),
        Options(title: "Duration", description: "I don't know >")
    ]
    
    func getTextDifficulty(_ num: Int?) -> String {
        switch (num){
        case 0:
            return "I don't know >"
        case 1:
            return "Easy >"
        case 2:
            return "Medium >"
        case 3:
            return "Hard >"
        default:
            return "I don't know >"
        }
    
    }
    
    func getTextDuration(_ num: Int?) -> String {
        switch (num){
        case 0:
            return "I don't know >"
        case 1:
            return "1 hour >"
        case 2:
            return "2 hours >"
        case 3:
            return "3 hours or more >"
        default:
            return "I don't know >"
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        
        if !add {
            textField.text = taskModel.title
        } else {
            createdTask = LocalTask()
            textField.text = createdTask?.title
        }
        
        createdTask?.difficulty = 1
        createdTask?.duration = 1
        configureTextFields()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    
        if !add {
            data[0].description = getTextDifficulty(Int(taskModel.difficulty))
            data[1].description = getTextDuration(Int(taskModel.duration))
        } else {
            data[0].description = getTextDifficulty(createdTask?.difficulty)
            data[1].description = getTextDuration(createdTask?.duration)
        }
        
    }
    
    private func configureTextFields(){
        textField.delegate = self
        
        if (textField.text == "") {
            addTaskButton.isEnabled = false
        } else {
            addTaskButton.isEnabled = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellGoals", for: indexPath) as! CardCellGoals
                
        cell.configure(title: data[indexPath.row].title, description: data[indexPath.row].description)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (data[indexPath.item].title == "Duration") {
            performSegue(withIdentifier: "durationSegue", sender: self)
        }
        if (data[indexPath.item].title == "Difficulty") {
            performSegue(withIdentifier: "difficultySegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "durationSegue" {
            if let destination = segue.destination as? DurationController {
                if !add {
                    destination.taskDuration = Int(taskModel.duration)
                    destination.add = false
                } else {
                    destination.taskDuration = createdTask!.duration
                    destination.add = true
                }
                
            }
        }
        
        if segue.identifier == "difficultySegue" {
            if let destination = segue.destination as? DifficultyController {
                
                if !add {
                    destination.taskDifficulty = Int(taskModel.difficulty)
                    destination.add = false
                } else {
                    destination.taskDifficulty = createdTask!.difficulty
                    destination.add = true
                }
            }
        }
    }
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func createItem(title: String, difficulty: Int, duration: Int, goal: CategoryTypes, category: CategoryTypes){
        let newItem = TaskModel(context: context)
        newItem.title = title
        newItem.difficulty = Int16(difficulty)
        newItem.duration = Int16(duration)
        newItem.goal = goal.rawValue
        newItem.category = category.rawValue
    
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    func updateDuration(newDuration: Int){
        
        taskModel.duration = Int16(newDuration)
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    func updateDifficulty(newDifficulty: Int){
        
        taskModel.difficulty = Int16(newDifficulty)
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    func updateTitle(newTitle: String){
        
        taskModel.title = newTitle
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    
    @IBAction func AddButton(_ sender: UIBarButtonItem) {
        
        if !(textField.text == ""){
            if add {
                createItem(title: textField.text!, difficulty: createdTask!.difficulty, duration: createdTask!.duration, goal: goal, category: category)
            } else {
                if taskModel.title != textField.text! {
                    updateTitle(newTitle: textField.text!)
                }
            }
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}

extension NewTaskViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        if !text.isEmpty{
            addTaskButton.isEnabled = true
        } else {
            addTaskButton.isEnabled = false
        }
        return true
    }
}


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
    
//    var currentTask: Task = Task()
    var task: NSManagedObject!
    
    var info: [String: CategoryTypes] = ["category" : "", "goal" : ""]
    
    struct Options {
        let title: String
        var description: String
    }
    
    var data: [Options] = [
        Options(title: "Difficulty", description: "I don't know >"),
        Options(title: "Duration", description: "I don't know >")
    ]
    
    func getText(_ num: Int) -> String {
        switch (num){
        case 0:
            return "I don't know"
        case 1:
            return "Low"
        case 2:
            return "Moderate"
        case 3:
            return "High"
        default:
            return "I don't know"
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        
        textField.text = currentTask.title
        
        configureTextFields()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        data[0].description = getText(currentTask.difficulty)
        data[1].description = getText(currentTask.duration)
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
                destination.task = currentTask
            }
        }
        
        if segue.identifier == "difficultySegue" {
            if let destination = segue.destination as? DifficultyController {
                destination.task = currentTask
            }
        }
    }
    @IBAction func AddButton(_ sender: UIBarButtonItem) {
        
        if !(textField.text == "") {
            self.navigationController?.popViewController(animated: true)
        }
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


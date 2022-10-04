//
//  NewTaskViewController.swift
//  Challenge04
//
//  Created by Victor Santos on 8/25/22.
//

import Foundation
import UIKit
import CoreData

class NewTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var addTaskButton: UIBarButtonItem!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var deleteBtn: UIButton!
    
    
    var taskModel = TaskModel()
    var createdTask: LocalTask?
    
    var category: CategoryTypes = .none
    var goal: CategoryTypes = .none
    
    var add: Bool  = true
    var urgency: Bool = false
    
    let mySwitch = UISwitch()
    var placeholderLabel : UILabel!
    
    struct Options {
        let title: String
        var description: String
    }
    
    var data: [Options] = [
        Options(title: "Difficulty", description: "I don't know"),
        Options(title: "Duration", description: "I don't know"),
        Options(title: "Urgency", description: "")
    ]
    
    func getTextDifficulty(_ num: Int?) -> String {
        switch (num){
        case 0:
            return "I don't know"
        case 1:
            return "Easy"
        case 2:
            return "Medium"
        case 3:
            return "Hard"
        default:
            return "I don't know"
        }
    }
    
    func getTextDuration(_ num: Int?) -> String {
        switch (num){
        case 0:
            return "I don't know"
        case 1:
            return "1 hour"
        case 2:
            return "2 hours"
        case 3:
            return "3 hours or more"
        default:
            return "I don't know"
        }
    }
    
    func createTextView(){
        descriptionText.delegate = self
        placeholderLabel = UILabel()
        placeholderLabel.text = "Description (optional)"
        placeholderLabel.font = .systemFont(ofSize: 15)
        placeholderLabel.sizeToFit()
        
        descriptionText.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (descriptionText.font?.pointSize)! / 2)
        placeholderLabel.textColor = .tertiaryLabel
        placeholderLabel.isHidden = !descriptionText.text.isEmpty
        
        descriptionText.textColor = .label
        descriptionText.font = .systemFont(ofSize: 15)
        
        titleTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: titleTextField.frame.height))
        titleTextField.leftViewMode = .always
        
        descriptionText.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        
        createTextView()
    
        if !add {
            deleteBtn.isHidden = false
            titleTextField.text = taskModel.title
            descriptionText.text = taskModel.descrip
            mySwitch.setOn(taskModel.urgency, animated: true)
            
        } else {
            deleteBtn.isHidden = true
            createdTask = LocalTask()
            titleTextField.text = createdTask?.title
            descriptionText.text = createdTask?.descrip
            mySwitch.setOn(createdTask!.urgency, animated: true)
        }
        
        createdTask?.difficulty = 1
        createdTask?.duration = 1
        
        configureTextFields()
        
        placeholderLabel.isHidden = !descriptionText.text.isEmpty
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
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
        titleTextField.delegate = self
        
        if (titleTextField.text == "" && descriptionText.text == "") {
            addTaskButton.isEnabled = false
        } else {
            addTaskButton.isEnabled = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure you'd like to delete this task?", message: "This task will not appear in your list anymore.", preferredStyle: .alert)

        let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in
            CoreDataFunctions().deleteItem(item: self.taskModel)
            self.navigationController?.popViewController(animated: true)
        }

        alert.addAction(yesAction)
    
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellGoals", for: indexPath) as! CardCellGoals
                
        cell.configure(title: data[indexPath.row].title, description: data[indexPath.row].description)
        
    
        if indexPath.row != 2 {
            cell.accessoryView = .none
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            
        } else {
            cell.accessoryType = .none
            
            mySwitch.onTintColor = UIColor(named: "FinishButton")
            
            mySwitch.tag = indexPath.row
            mySwitch.addTarget(self, action: #selector(self.switchDidChange(_:)), for: .valueChanged)
            
            cell.accessoryView = mySwitch
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    @objc func switchDidChange(_ sender: UISwitch){
        if add {
            createdTask?.urgency = sender.isOn
        }
        
        urgency = sender.isOn
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (data[indexPath.item].title == "Duration") {
            performSegue(withIdentifier: "durationSegue", sender: self)
        }
        if (data[indexPath.item].title == "Difficulty") {
            performSegue(withIdentifier: "difficultySegue", sender: self)
        }
    }
    
    func updateDuration(newDuration: Int){
        taskModel.duration = Int16(newDuration)
        
        do {
            try context.save()
        } catch {
        }
    }
    
    func updateDifficulty(newDifficulty: Int){
        taskModel.difficulty = Int16(newDifficulty)
        
        do {
            try context.save()
        } catch {
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
    
    
    @IBAction func AddButton(_ sender: UIBarButtonItem) {
        if !(titleTextField.text == ""){
            if add {
                CoreDataFunctions().createItem(title: titleTextField.text!, difficulty: createdTask!.difficulty, duration: createdTask!.duration, goal: goal, category: category, descrip: descriptionText.text, urgency: createdTask!.urgency)
                
            } else {
                if taskModel.title != titleTextField.text! {
                    CoreDataFunctions().updateTitle(taskModel: self.taskModel, newTitle: titleTextField.text!)
                }
                if taskModel.descrip != descriptionText.text {
                    CoreDataFunctions().updateDescrip(taskModel: self.taskModel, newDescrip: descriptionText.text)
                }
                if taskModel.urgency != urgency {
                    CoreDataFunctions().updateUrgency(taskModel: self.taskModel, newUrgency: urgency)
                }
            }
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}

extension NewTaskViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ titleTextField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textField(_ titleTextField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let text = (titleTextField.text! as NSString).replacingCharacters(in: range, with: string)

        if !text.isEmpty{
            addTaskButton.isEnabled = true
        } else {
            addTaskButton.isEnabled = false
        }
        return true
    }
}


extension NewTaskViewController : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}

class CardCellGoals: UITableViewCell {

    @IBOutlet weak var titleOptions: UILabel!
    @IBOutlet weak var descriptionOptions: UILabel!
    
    func configure(title: String, description: String){
        titleOptions.text = title
        descriptionOptions.text = description
    }
    
}

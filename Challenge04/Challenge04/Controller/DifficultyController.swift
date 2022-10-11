//
//  DifficultyController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 29/08/22.
//

import Foundation
import UIKit

class DifficultyController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var taskDifficulty = 0
    var isNewTask = true
    
    struct Options {
        let id: Int
        let type: String
        var check: Bool
    }
    
    var data: [Options] = [
        Options(id: 1, type: "Easy", check: false),
        Options(id: 2, type: "Medium", check: false),
        Options(id: 3, type: "Hard", check: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        data[taskDifficulty-1].check = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDifficulty", for: indexPath) as! CardCellDifficulty
        
        cell.configure(title: data[indexPath.row].type)
        
        cell.accessoryType = data[indexPath.row].check ? .checkmark : .none
        
        cell.tintColor = UIColor.init(named: "MainTitle")
        cell.backgroundColor = UIColor.clear
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clearCheck()
        
        data[indexPath.row].check.toggle()
        
        taskDifficulty = data[indexPath.row].id
        
        tableView.reloadRows(at:[indexPath],with:.none)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.03) {
            self.navigationController?.popViewController(animated: true)
            let destination = self.navigationController?.viewControllers.last as! NewTaskViewController
            
            if !self.isNewTask {
                destination.updateDifficulty(newDifficulty: self.taskDifficulty)
            } else {
                destination.createdTask?.difficulty = self.taskDifficulty
            }
        }
    }
    
    func clearCheck(){
        data[0].check = false
        data[1].check = false
        data[2].check = false
        tableView.reloadData()
    }
}

class CardCellDifficulty: UITableViewCell {
    
    @IBOutlet weak var titleOptions: UILabel!
    
    func configure(title: String){
        titleOptions.text = title
    }
}


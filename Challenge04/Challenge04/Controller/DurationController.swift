//
//  DurationController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 29/08/22.
//

import Foundation
import UIKit

class DurationController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var taskDuration : Int = 0
    var add = true
    
    struct Options {
        let id: Int
        let type: String
        var check: Bool
    }
    
    var data: [Options] = [
        Options(id: 1, type: "1 hour", check: false),
        Options(id: 2, type: "2 hours", check: false),
        Options(id: 3, type: "3 hours or more", check: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        data[taskDuration-1].check = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDuration", for: indexPath) as! CardCellDuration
        
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
        
        taskDuration = data[indexPath.row].id
        
        tableView.reloadRows(at:[indexPath], with:.none)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.03) {
            self.navigationController?.popViewController(animated: true)
            let destination = self.navigationController?.viewControllers.last as! NewTaskViewController
            
            if !self.add {
                destination.updateDuration(newDuration: self.taskDuration)
            } else {
                destination.createdTask?.duration = self.taskDuration
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

class CardCellDuration: UITableViewCell {
    
    @IBOutlet weak var titleOptions: UILabel!
    
    func configure(title: String){
        titleOptions.text = title
    }
}

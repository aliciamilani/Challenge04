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
    
    var task:Task = Task()
    
    struct Options {
        let type: String
        var check: Bool
    }
    
    var data: [Options] = [
        Options(type: "I don't know", check: false),
        Options(type: "Low", check: false),
        Options(type: "Moderate", check: false),
        Options(type: "High", check: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        data[task.difficulty].check = true
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
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clearCheck()
        
        data[indexPath.row].check.toggle()
        
        tableView.reloadRows(at:[indexPath],with:.none)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.03) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func clearCheck(){
        data[0].check = false
        data[1].check = false
        data[2].check = false
        data[3].check = false
        tableView.reloadData()
    }
}

class CardCellDifficulty: UITableViewCell {

    @IBOutlet weak var titleOptions: UILabel!
    
    func configure(title: String){
        titleOptions.text = title
    }
}


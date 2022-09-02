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
        
        data[task.duration].check = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDuration", for: indexPath) as! CardCellDuration
        
        cell.configure(title: data[indexPath.row].type)
        
        return cell
    }

}

class CardCellDuration: UITableViewCell {

    @IBOutlet weak var titleOptions: UILabel!
    
    func configure(title: String){
        titleOptions.text = title
    }
}

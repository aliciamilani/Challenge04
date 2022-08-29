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
    
    struct Options {
        let type: String
    }
    
    let data: [Options] = [
        Options(type: "I don't know"),
        Options(type: "Low"),
        Options(type: "Moderate"),
        Options(type: "High"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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

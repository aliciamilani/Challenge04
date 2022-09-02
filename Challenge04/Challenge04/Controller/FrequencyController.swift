//
//  FrequencyController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 29/08/22.
//

import Foundation
import UIKit

class FrequencyController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    struct Options {
        let type: String
    }
    
    let data: [Options] = [
        Options(type: "Never"),
        Options(type: "Everyday"),
        Options(type: "Every week"),
        Options(type: "Every month"),
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFrequency", for: indexPath) as! CardCellFrequency
        
        cell.configure(title: data[indexPath.row].type)
        
        return cell
    }

}

class CardCellFrequency: UITableViewCell {

    @IBOutlet weak var titleOptions: UILabel!
    
    func configure(title: String){
        titleOptions.text = title
    }
}


//
//  DailyTasksController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import UIKit

class DailyTasksController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let myData = ["first", "second", "third", "four", "five"]
    let myData2 = ["first",  "second", "third", "four", "five"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        cardTableView.register(UITableViewCell.self,
//                               forCellReuseIdentifier: "TableViewCell")
        
//        self.cardTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        dateLabel.text = getCurrentTime()
        messageLabel.text = "Tenho aqui algumas atividades pra você ser produtivo mesmo estando triste"
    }
    
    // TableView funcs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        
        cell.configure(title: myData[indexPath.row], description: myData2[indexPath.row])
        
//        cell.layer.cornerRadius = 10.0;
        
//        cell.textLabel?.text = myData[indexPath.row]
        
        return cell
    }
}

func getCurrentTime() -> String {
    let date = Date()
    let calendar = Calendar.current
    let day = calendar.component(.day, from: date)
    let month = calendar.component(.month, from: date)
    let year = calendar.component(.year, from: date)
    let thedate = "\(day)/\(month)/\(year)"
    
    return thedate
}

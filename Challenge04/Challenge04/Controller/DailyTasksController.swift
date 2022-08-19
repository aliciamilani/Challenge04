//
//  DailyTasksController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import UIKit

class DailyTasksController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var wecolmeMessage: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var humor = ""
    
    let data = getTasks()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        dateLabel.text = getCurrentTime()
        messageLabel.text = getMessage(humor: humor)
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        cell.configure(title: data[indexPath.row].title, description: data[indexPath.row].description)
        return cell
    }
}

func getCurrentTime() -> String {
    
    let currentLocale:Locale = NSLocale(localeIdentifier: Locale.preferredLanguages.first!) as Locale
    let currentDate =  Date()
    
    let stringDate = currentDate.formatted(.dateTime
                     .day(.twoDigits)
                     .month(.wide)
                     .weekday(.short)
                     .locale(currentLocale))
    
    let thedate = "\(stringDate)"
    return thedate
}

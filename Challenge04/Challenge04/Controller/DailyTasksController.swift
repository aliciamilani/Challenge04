//
//  DailyTasksController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import UIKit

class DailyTasksController : UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var wecolmeMessage: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var humor = ""
    
    var data = getTasks()
    
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
    
    
    func tableView(_ tableView: UITableView,
                       trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        // Trash action
        let trash = UIContextualAction(style: .destructive,
                                       title: "Trash") { [weak self] (action, view, completionHandler) in
            guard let self = self else {return}
            self.data.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
        }
        trash.backgroundColor = .systemRed

        let configuration = UISwipeActionsConfiguration(actions: [trash])

        return configuration
    }
    
    
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
}

extension DailyTasksController: UITableViewDelegate {
    private func handleMarkAsFavourite() {
        print("Marked as favourite")
    }

    private func handleMarkAsUnread() {
        print("Marked as unread")
    }

    private func handleMoveToTrash() {
        print("Moved to trash")
    }

    private func handleMoveToArchive() {
        print("Moved to archive")
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



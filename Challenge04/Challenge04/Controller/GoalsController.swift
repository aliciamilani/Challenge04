//
//  GoalsController.swift
//  Challenge04
//
//  Created by Victor Santos on 8/24/22.
//

import Foundation
import UIKit

class GoalsController: UIViewController {
    
    
    @IBOutlet weak var workBtn: UIButton!
    @IBOutlet weak var studyBtn: UIButton!
    @IBOutlet weak var othersStudyBtn: UIButton!
    @IBOutlet weak var othesSportsBtn: UIButton!
    @IBOutlet weak var exerciseBtn: UIButton!
    @IBOutlet weak var foodBtn: UIButton!
    @IBOutlet weak var leisureBtn: UIButton!
    @IBOutlet weak var othersArtBtn: UIButton!
    @IBOutlet weak var hobbiesBtn: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmButton.alpha = 0
        confirmButton.isEnabled = false
        
        self.navigationController?.navigationBar.tintColor = UIColor.mainTitle
    }
    
    @IBAction func confirmAction(_ sender: UIButton) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        
        let defaults = UserDefaults.standard
        
        if defaults.bool(forKey: "goalsButton") {
            confirmButton.alpha = 1
            confirmButton.isEnabled = true
        } else {
            confirmButton.alpha = 0
            confirmButton.isEnabled = false
        }
    }
    
    @IBAction func goalsChoice(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "study" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .studies
                destination.goal = .study
            }
        }
        
        if segue.identifier == "work" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .studies
                destination.goal = .work
            }
        }
        
        if segue.identifier == "othersStudy" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .studies
                destination.goal = .othersStudy
            }
        }
        
        if segue.identifier == "food" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .sports
                destination.goal = .food
            }
        }
        
        if segue.identifier == "exercise" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .sports
                destination.goal = .exercise
            }
        }
        
        if segue.identifier == "othersSports" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .sports
                destination.goal = .othersSports
            }
        }
        
        if segue.identifier == "leisure" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .art
                destination.goal = .leisure
            }
        }
        
        if segue.identifier == "hobbies" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .art
                destination.goal = .hobbies
            }
        }
        
        if segue.identifier == "othersArt" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .art
                destination.goal = .othersArt
            }
        }
    }
}

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
        
        self.navigationController?.navigationBar.tintColor = UIColor(named: "MainTitle")
    }
    
    @IBAction func confirmAction(_ sender: UIButton) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
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
                destination.category = .Studies
                destination.goal = .Study
            }
        }
        
        if segue.identifier == "work" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Studies
                destination.goal = .Work
            }
        }
        
        if segue.identifier == "othersStudy" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Studies
                destination.goal = .OthersStudy
            }
        }
        
        if segue.identifier == "food" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Sports
                destination.goal = .Food
            }
        }
        
        if segue.identifier == "exercise" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Sports
                destination.goal = .Exercise
            }
        }
        
        if segue.identifier == "othersSports" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Sports
                destination.goal = .OthersSports
            }
        }
        
        if segue.identifier == "leisure" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Art
                destination.goal = .Leisure
            }
        }
        
        if segue.identifier == "hobbies" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Art
                destination.goal = .Hobbies
            }
        }
        
        if segue.identifier == "othersArt" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Art
                destination.goal = .OthersArt
            }
        }
        
    }
}

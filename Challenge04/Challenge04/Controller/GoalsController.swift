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
//        confirmButton.alpha = 1.0
//        confirmButton.isEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "schoolSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Study
                destination.goal = .Food
            }
        }
        
        if segue.identifier == "collegeSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Study
                destination.goal = .Exercise
            }
        }
        
        if segue.identifier == "soccerSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Work
                destination.goal = .OthersSports
            }
        }
        
        if segue.identifier == "electronicsSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Work
                destination.goal = .Leisure
            }
        }
        
        if segue.identifier == "basketballSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Work
                destination.goal = .Hobbies
            }
        }
        
        if segue.identifier == "paintingSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .OthersStudy
                destination.goal = .OthersArt
            }
        }
        
        if segue.identifier == "drawingSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .OthersStudy
                destination.goal = .Drawing
            }
        }
        
        if segue.identifier == "crochetSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .OthersStudy
                destination.goal = .Crochet
            }
        }
    }
}

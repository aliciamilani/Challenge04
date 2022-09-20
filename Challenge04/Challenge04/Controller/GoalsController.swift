//
//  GoalsController.swift
//  Challenge04
//
//  Created by Victor Santos on 8/24/22.
//

import Foundation
import UIKit

class GoalsController: UIViewController {
    
    
    @IBOutlet weak var study1Btn: UIButton!
    @IBOutlet weak var study2Btn: UIButton!
    @IBOutlet weak var sport1Btn: UIButton!
    @IBOutlet weak var sport2Btn: UIButton!
    @IBOutlet weak var sport3Btn: UIButton!
    @IBOutlet weak var arts1Btn: UIButton!
    @IBOutlet weak var arts2Btn: UIButton!
    @IBOutlet weak var arts3Btn: UIButton!
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
                destination.category = .Studies
                destination.goal = .School
            }
        }
        
        if segue.identifier == "collegeSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Studies
                destination.goal = .College
            }
        }
        
        if segue.identifier == "soccerSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Sports
                destination.goal = .Soccer
            }
        }
        
        if segue.identifier == "electronicsSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Sports
                destination.goal = .Eletronics
            }
        }
        
        if segue.identifier == "basketballSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Sports
                destination.goal = .Basketball
            }
        }
        
        if segue.identifier == "paintingSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Art
                destination.goal = .Painting
            }
        }
        
        if segue.identifier == "drawingSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Art
                destination.goal = .Drawing
            }
        }
        
        if segue.identifier == "crochetSegue" {
            if let destination = segue.destination as? AllTasksController {
                destination.category = .Art
                destination.goal = .Crochet
            }
        }
    }
}

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
    @IBOutlet weak var study3Btn: UIButton!
    @IBOutlet weak var sport1Btn: UIButton!
    @IBOutlet weak var sport2Btn: UIButton!
    @IBOutlet weak var sport3Btn: UIButton!
    @IBOutlet weak var arts1Btn: UIButton!
    @IBOutlet weak var arts2Btn: UIButton!
    @IBOutlet weak var arts3Btn: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.isEnabled = false
        confirmButton.alpha = 0.5
    }
    
    @IBAction func confirmAction(_ sender: UIButton) {
        
        
    }
    
    @IBAction func goalsChoice(_ sender: UIButton) {
        confirmButton.alpha = 1.0
        confirmButton.isEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "schoolSegue" {
            if let firstDestination = segue.destination as? UINavigationController,
               let destination = firstDestination.topViewController as? NewTaskViewController {
//                destination.currentTask.category = .Studies
                destination.info["category"] = .Studies
//                destination.currentTask.goal = .School
                destination.info["goal"] = .School
                
            }
        }
    }
}

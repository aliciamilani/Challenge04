//
//  ViewController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    
    @IBOutlet weak var humorImage: UIImageView!
    @IBOutlet weak var humorTitle: UILabel!
    
    var goButton: Bool = false
    
    // MARK: - Main
    
    
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        humorTitle.text = "Confident"
        //humorImage.image = UIImage(named: "")
        
    }

    @IBAction func humorButtons(_ sender: UIButton) {
        
        // Change button color when selected
        var color = sender.backgroundColor
        color = (color == UIColor.brown) ? UIColor.black : UIColor.brown
        
        if color == .black {
            sender.alpha = 1.0
        }
        else {
            sender.alpha = 0.7
        }
        
    }
    
    @IBAction func goButton(_ sender: UIButton) {
        
        
        
    }
}


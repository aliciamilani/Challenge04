//
//  ViewController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var humorImage: UIImageView!
    @IBOutlet weak var confidentBtn: UIButton!
    @IBOutlet weak var happyBtn: UIButton!
    @IBOutlet weak var sadBtn: UIButton!
    @IBOutlet weak var impatientBtn: UIButton!
    @IBOutlet weak var tiredBtn: UIButton!
    @IBOutlet weak var angerBtn: UIButton!
    
    

    @IBAction func humorButtons(_ sender: UIButton) {
        
        // Change button color when selected
//        var color = sender.tintColor
//        color = (color == UIColor.brown) ? UIColor.black : UIColor.brown
//
//        if color == .black {
//            sender.alpha = 1.0
//        }
//        else {
//            sender.alpha = 0.7
//        }
        
    }
    
    @IBAction func goButton(_ sender: UIButton) {
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confidentBtn.layer.cornerRadius = 25
    }
}


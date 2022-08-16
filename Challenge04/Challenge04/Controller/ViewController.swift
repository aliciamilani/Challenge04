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
    @IBOutlet weak var humorTitle: UILabel!
    @IBOutlet weak var confidentBtn: UIButton!
    @IBOutlet weak var happyBtn: UIButton!
    @IBOutlet weak var sadBtn: UIButton!
    @IBOutlet weak var impatientBtn: UIButton!
    @IBOutlet weak var tiredBtn: UIButton!
    @IBOutlet weak var angerBtn: UIButton!
    
    var goButton: Bool = false


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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        humorTitle.text = "Confident"
        //humorImage.image = UIImage(named: "")
        mainTitle.text = "How are you feeling today?"
        confidentBtn.titleLabel?.text = "Confident"
        confidentBtn.backgroundColor = .brown
        confidentBtn.alpha = 1.0
        happyBtn.titleLabel?.text = "Happy"
        happyBtn.backgroundColor = .black
        happyBtn.alpha = 0.7
        confidentBtn.titleLabel?.text = "Confident"
        confidentBtn.alpha = 0.7
        confidentBtn.backgroundColor = .black
        sadBtn.titleLabel?.text = "Sad"
        sadBtn.alpha = 0.7
        sadBtn.backgroundColor = .black
        impatientBtn.titleLabel?.text = "Impatient"
        impatientBtn.alpha = 0.7
        impatientBtn.backgroundColor = .black
        tiredBtn.titleLabel?.text = "Tired"
        tiredBtn.alpha = 0.7
        tiredBtn.backgroundColor = .black
        angerBtn.titleLabel?.text = "Anger"
        angerBtn.alpha = 0.7
        angerBtn.backgroundColor = .black
    }
}


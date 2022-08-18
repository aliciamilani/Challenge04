//
//  ViewController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    
    // var buttonsConfig = ButtonsConfig()
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var humorImage: UIImageView!
    @IBOutlet weak var confidentBtn: UIButton!
    @IBOutlet weak var happyBtn: UIButton!
    @IBOutlet weak var sadBtn: UIButton!
    @IBOutlet weak var indifferentBtn: UIButton!
    @IBOutlet weak var tiredBtn: UIButton!
    @IBOutlet weak var irritatedBtn: UIButton!
    @IBOutlet weak var goBtn: UIButton!
    
    // MARK: - Main
    
    
    
    // MARK: - Functions

    @IBAction func humorButtons(_ sender: UIButton) {
        goBtn.alpha = 1.0
        goBtn.isUserInteractionEnabled = true
        
//        guard let image = sender.currentTitle else { return }
//        humorImage.image = UIImage.init(named: image)
        
        isSelectedButton()
        sender.isSelected = true
        
        
        
    }
    
    @IBAction func goButton(_ sender: UIButton) {
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goBtn.alpha = 0.5
        goBtn.isUserInteractionEnabled = false
//      humorImage.image = UIImage.init(named: "NoFace")
    }
    
    func isSelectedButton () {
        
        sadBtn.isSelected = false
        tiredBtn.isSelected = false
        happyBtn.isSelected = false
        irritatedBtn.isSelected = false
        confidentBtn.isSelected = false
        indifferentBtn.isSelected = false
        
    }
    
}


//
//  ViewController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    
    var humorSelected: String = ""
    
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
        
        guard let imageName = sender.titleLabel?.text else { return }
        humorImage.image = UIImage.init(named: imageName)
        
        isSelectedButton()
        sender.layer.borderWidth = 1
        sender.layer.cornerRadius = 12
        sender.layer.borderColor = UIColor.black.cgColor
        
        humorSelected = imageName
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goBtn.alpha = 0.5
        goBtn.isUserInteractionEnabled = false
        //humorImage.image = UIImage.init(named: "")
    }
    
    func isSelectedButton () {
        
        sadBtn.layer.borderColor = UIColor.clear.cgColor
        tiredBtn.layer.borderColor = UIColor.clear.cgColor
        happyBtn.layer.borderColor = UIColor.clear.cgColor
        irritatedBtn.layer.borderColor = UIColor.clear.cgColor
        confidentBtn.layer.borderColor = UIColor.clear.cgColor
        indifferentBtn.layer.borderColor = UIColor.clear.cgColor
        
    }
    
}


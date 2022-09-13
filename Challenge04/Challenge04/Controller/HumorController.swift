//
//  ViewController.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import UIKit

class HumorController: UIViewController {
    
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.layer.zPosition = -1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goBtn.alpha = 0.5
        goBtn.isUserInteractionEnabled = false
        
        
        humorImage.image = UIImage.init(named: "Humor/Shadow")
    }

    @IBAction func humorButtons(_ sender: UIButton) {
        goBtn.alpha = 1.0
        goBtn.isUserInteractionEnabled = true
        
        guard var imageName = sender.titleLabel?.text else { return }
        
        humorSelected = imageName
        
        imageName = "Humor/" + imageName
        humorImage.image = UIImage.init(named: imageName)
        
        isSelectedButton()
        sender.layer.borderWidth = 1
        sender.layer.cornerRadius = 12
        sender.layer.borderColor = UIColor.label.cgColor
    }
    
    func isSelectedButton () {
        
        sadBtn.layer.borderColor = UIColor.clear.cgColor
        tiredBtn.layer.borderColor = UIColor.clear.cgColor
        happyBtn.layer.borderColor = UIColor.clear.cgColor
        irritatedBtn.layer.borderColor = UIColor.clear.cgColor
        confidentBtn.layer.borderColor = UIColor.clear.cgColor
        indifferentBtn.layer.borderColor = UIColor.clear.cgColor
        
    }
    
    func accessibility () {
        mainTitle.isAccessibilityElement = true
        humorImage.accessibilityLabel = "Humor image selectedt"
        indifferentBtn.isAccessibilityElement = true
        confidentBtn.isAccessibilityElement = true
        irritatedBtn.isAccessibilityElement = true
        happyBtn.isAccessibilityElement = true
        tiredBtn.isAccessibilityElement = true
        sadBtn.isAccessibilityElement = true
        goBtn.isAccessibilityElement = true
        humorImage.isAccessibilityElement = true
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func createItem(humor: String){
        do {
            let newItem = HumorModel(context: context)
            
            newItem.data = Date()
            newItem.humor = humor
            
            try context.save()
        } catch {
            // error
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        createItem(humor: humorSelected)
        
        if let destinationViewController = segue.destination as? DailyTasksController {
            destinationViewController.humor = humorSelected
        }
    }
    
}


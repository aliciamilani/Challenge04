//
//  CardCell.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 17/08/22.
//

import UIKit

class CardCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    
    func configure(title: String, description: String){
        titleLabel.text = title
        descriptionLabel.text = description
        
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cardView.layer.shadowOpacity = 1.0
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 12.0
    }
}


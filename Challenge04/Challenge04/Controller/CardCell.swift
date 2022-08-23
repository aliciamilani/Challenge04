//
//  CardCell.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 17/08/22.
//

import UIKit

class CardCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    
    func configure(title: String, description: String){
        titleLabel.text = title
        cardView.layer.cornerRadius = 12.0
    }
}


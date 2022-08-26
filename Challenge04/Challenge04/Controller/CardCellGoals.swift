//
//  CardCellGoals.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 26/08/22.
//

import UIKit

class CardCellGoals: UITableViewCell {

    @IBOutlet weak var titleOptions: UILabel!
    @IBOutlet weak var descriptionOptions: UILabel!
    
    
    
    func configure(title: String, description: String){
        titleOptions.text = title
        descriptionOptions.text = description
    }
    
}

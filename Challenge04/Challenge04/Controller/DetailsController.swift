//
//  DatailsController.swift
//  GoMoo
//
//  Created by Anna Alicia Milani on 21/09/22.
//

import Foundation
import UIKit
import CoreData

class DetailsController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func close(_ sender: Any) {
        print("oi")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func closeView(_ sender: Any) {
        print("oi")
        self.navigationController?.popViewController(animated: <#T##Bool#>)
    }
}

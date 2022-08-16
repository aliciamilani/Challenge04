//
//  Goal.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import Foundation

class Goal {
    var cod: String
    var title : String
    
    init(title: String){
        self.cod = UUID().uuidString
        self.title = title
    }
    
    init(){
        self.cod = UUID().uuidString
        self.title = "-"
    }
    
    func getCod() -> String {
        return self.cod
    }
}

//
//  Task.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import Foundation

class LocalTask {
    
    var title : String
    var difficulty : Int
    var duration : Int
    var category: CategoryTypes?
    var goal: CategoryTypes?
    var descrip: String
    var isUrgent: Bool
    
    init(title: String, difficulty: Int, duration: Int, category: CategoryTypes, goal: CategoryTypes, descrip: String, isUrgent: Bool){
        self.title = title
        self.difficulty = difficulty
        self.duration = duration
        self.category = category
        self.goal = goal
        self.descrip = descrip
        self.isUrgent = isUrgent
    }
    
    init(){
        self.title = ""
        self.difficulty = 0
        self.duration = 0
        self.descrip = ""
        self.isUrgent = false
    }
}

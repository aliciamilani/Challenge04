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
    
    var points: Float
    
    var category: CategoryTypes
    var goal: CategoryTypes
    
    var descrip: String
    
    var urgency: Bool
    
    init(title: String, difficulty: Int, duration: Int, category: CategoryTypes, goal: CategoryTypes, descrip: String, urgency: Bool){
        self.title = title
        
        self.difficulty = difficulty
        self.duration = duration
        
        // calculate priority
        self.points = Float(difficulty + duration)
        
        self.category = category
        self.goal = goal
        
        self.descrip = descrip
        self.urgency = urgency
    }
    
    init(){
        self.title = ""
        
        self.difficulty = 0
        self.duration = 0
        
        self.points = 0
        self.category = .none
        self.goal = .none
        
        self.descrip = ""
        self.urgency = false
    }
}

@objc
public enum CategoryTypes: Int16 {
    case studies = 1,
         study = 2,
         work = 3,
         othersStudy = 4,
         sports = 5,
         food = 6,
         exercise = 7,
         othersSports = 8,
         art = 9,
         leisure = 10,
         hobbies = 11,
         othersArt = 12,
         none = 0
}


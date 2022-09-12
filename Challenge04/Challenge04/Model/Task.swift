//
//  Task.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import Foundation

class LocalTask {
    var cod: UUID
    var title : String
    
    var difficulty : Int
    var duration : Int
    
    var points: Float
    
    var category: CategoryTypes
    var goal: CategoryTypes

    
    init(title: String, difficulty: Int, duration: Int, category: CategoryTypes, goal: CategoryTypes){
        self.cod = UUID()
        self.title = title
        
        self.difficulty = difficulty
        self.duration = duration
        
        // calculate priority
        self.points = Float(difficulty + duration)
        
        self.category = category
        self.goal = goal
    }
    
    init(){
        self.cod = UUID()
        self.title = ""
        
        self.difficulty = 0
        self.duration = 0
        
        self.points = 0
        self.category = .none
        self.goal = .none
    }
}

@objc
public enum CategoryTypes: Int16 {
    case Studies = 1,
        Sports = 2,
        Art = 3,
        School = 4,
        College = 5,
        Soccer = 6,
        Eletronics = 7,
        Basketball = 8,
        Painting = 9,
        Drawing = 10,
        Crochet = 11,
        none = 0
}

func getTasks() -> ([LocalTask]){
    
    let tasksArray = [
        LocalTask(
            title: "Study outstanding math subjects",
            difficulty: 2,
            duration: 2,
            category: .Studies,
            goal: .School
        ),
        
        LocalTask(
            title: "Practice soccer",
            difficulty: 2,
            duration: 1,
            category: .Sports,
            goal: .Soccer
        ),
        
        LocalTask(
            title: "Advance reading of next year's paradidactic",
            difficulty: 1,
            duration: 1,
            category: .Studies,
            goal: .College
        ),
        
        LocalTask(
            title: "Play new X game update",
            difficulty: 2,
            duration: 1,
            category: .Sports,
            goal: .Eletronics
        ),
    ]
    
    return tasksArray

}

func getAllTasks() -> ([LocalTask]){
    
    let tasksArray = [
        LocalTask(
            title: "aaa",
            difficulty: 2,
            duration: 2,
            category: .Studies,
            goal: .School
        ),
        
        LocalTask(
            title: "bbbb",
            difficulty: 2,
            duration: 1,
            category: .Sports,
            goal: .Soccer
        ),
        
        LocalTask(
            title: "cccc",
            difficulty: 1,
            duration: 1,
            category: .Studies,
            goal: .College
        ),
        
        LocalTask(
            title: "dddddd",
            difficulty: 2,
            duration: 1,
            category: .Sports,
            goal: .Eletronics
        ),
    ]
    
    return tasksArray

}


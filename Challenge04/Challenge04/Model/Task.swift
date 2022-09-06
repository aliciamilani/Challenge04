//
//  Task.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import Foundation

class Task {
    var cod: UUID
    var title : String
    
    var difficulty : Int
    var duration : Int
    
    var points: Float
    
    var category: CategoryTypes
    var goal: CategoryGoals

    
    init(title: String, difficulty: Int, duration: Int, category: CategoryTypes, goal: CategoryGoals){
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
    case Studies = 1
    case Sports = 2
    case Art = 3
    case none = 0
}

@objc
public enum CategoryGoals: Int16 {
    case School = 1
    case College = 2
    case Soccer = 3
    case Eletronics = 4
    case Basketball = 5
    case Painting = 6
    case Drawing = 7
    case Crochet = 8
    case none = 0
}

func getTasks() -> ([Task]){
    
    let tasksArray = [
        Task(
            title: "Study outstanding math subjects",
            difficulty: 2,
            duration: 2,
            category: .Studies,
            goal: .School
        ),
        
        Task(
            title: "Practice soccer",
            difficulty: 2,
            duration: 1,
            category: .Sports,
            goal: .Soccer
        ),
        
        Task(
            title: "Advance reading of next year's paradidactic",
            difficulty: 1,
            duration: 1,
            category: .Studies,
            goal: .College
        ),
        
        Task(
            title: "Play new X game update",
            difficulty: 2,
            duration: 1,
            category: .Sports,
            goal: .Eletronics
        ),
    ]
    
    return tasksArray

}

func getAllTasks() -> ([Task]){
    
    let tasksArray = [
        Task(
            title: "aaa",
            difficulty: 2,
            duration: 2,
            category: .Studies,
            goal: .School
        ),
        
        Task(
            title: "bbbb",
            difficulty: 2,
            duration: 1,
            category: .Sports,
            goal: .Soccer
        ),
        
        Task(
            title: "cccc",
            difficulty: 1,
            duration: 1,
            category: .Studies,
            goal: .College
        ),
        
        Task(
            title: "dddddd",
            difficulty: 2,
            duration: 1,
            category: .Sports,
            goal: .Eletronics
        ),
    ]
    
    return tasksArray

}


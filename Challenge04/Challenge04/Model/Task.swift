//
//  Task.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import Foundation

class Task {
    var cod: String
    var title : String
    
    var difficulty : Int
    var duration : Int
    
    var points: Float
    
    var category: CategoryTypes
    var goal: CategoryGoals

    
    init(title: String, difficulty: Int, duration: Int, category: CategoryTypes, goal: CategoryGoals){
        self.cod = UUID().uuidString
        self.title = title
        
        self.difficulty = difficulty
        self.duration = duration
        
        // calculate priority
        self.points = Float(difficulty + duration)
        
        self.category = category
        self.goal = goal
    }
    
    init(){
        self.cod = UUID().uuidString
        self.title = ""
        
        self.difficulty = -1
        self.duration = -1
        
        self.points = 0
        self.category = .none
        self.goal = .none
    }
}

enum CategoryTypes {
    case Studies, Sports, Art, none
}

enum CategoryGoals {
    case School, College, Soccer, Eletronics, Basketball, Painting, Drawing, Crochet, none
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


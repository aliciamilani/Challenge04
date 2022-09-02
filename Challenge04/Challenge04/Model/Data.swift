//
//  Data.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 02/09/22.
//

import Foundation

class Data {
    
    public var tasksArray = [
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
    
    public func getAllTasks() -> ([Task]){
        
        return tasksArray
    }
    
    public func addTasks(task: Task){
        
        tasksArray.append(task)
    }
}


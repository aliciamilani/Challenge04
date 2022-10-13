//
//  HumorSelection.swift
//  Challenge04
//
//  Created by Victor Santos on 8/16/22.
//

import Foundation
import UIKit
import CoreData

private var taskModel = [TaskModel]()
private var easyList = [TaskModel]()
private var mediumList = [TaskModel]()
private var hardList = [TaskModel]()

private let userDefaults = UserDefaults.standard
public let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

private var listOfTasks: [String] = []

private let taskPerHumor: [HumorTypes:Int] =
[.happy: 3,
 .confident: 3,
 .indifferent: 3,
 .irritated: 2,
 .tired: 1,
 .sad: 2]

public func getAllItems() {
    do {
        taskModel = try context.fetch(TaskModel.fetchRequest())
    } catch {
        fatalError("Unable to load data.")
    }
}

private func divideTasksByLevel() {
    for task in taskModel {
        
        if !task.isUrgent {
            if (task.difficulty == 1 && task.duration == 1) || (task.difficulty == 1 && task.duration == 2) || (task.difficulty == 2 && task.duration == 1) {
                easyList.append(task)
            }
            
            if (task.difficulty == 2 && task.duration == 2) || (task.difficulty == 2 && task.duration == 3) || (task.difficulty == 1 && task.duration == 3) {
                mediumList.append(task)
            }
            
            if (task.difficulty == 3 && task.duration == 3) || (task.difficulty == 3 && task.duration == 2) || (task.difficulty == 3 && task.duration == 1) {
                hardList.append(task)
            }
        }
    }
}


public func getDailyMessage(humor: HumorTypes) -> (String){
    switch(humor){
        
    case .happy:
        return "Glad you're happy today! Let's complete the day with some activities?"
        
    case .confident:
        return "I liked the attitude! Let's rock today!"
        
    case .indifferent:
        return "Animation, cowboy! You can do it!"
        
    case .irritated:
        return "Take it easy! I separated some very special activities for you today!"
        
    case .sad:
        return "Don't worry! I have your back. There are some small activities for today: "
        
    case .tired:
        return "You'll feel a lot better when you finish today's activities! Let's go"
        
    }
}

public func getDailyTasks(humor: HumorTypes){
    
    var allTasks = [TaskModel]()
    
    getAllItems()
    divideTasksByLevel()
    
    let numberOfTaskByHumor = taskPerHumor[humor]!
    
    if taskModel.count != 0 {
        if humor == .happy || humor == .confident{
            allTasks = hardList + mediumList + easyList
            
            for i in 1...numberOfTaskByHumor{
                listOfTasks.append(allTasks[i].objectID.uriRepresentation().absoluteString)
            }
        }
        
        if humor == .indifferent {
            allTasks = mediumList + hardList + easyList
            
            for i in 1...numberOfTaskByHumor{
                listOfTasks.append(allTasks[i].objectID.uriRepresentation().absoluteString)
            }
        }
        
        if humor == .irritated || humor == .tired || humor == .sad {
            allTasks = easyList + mediumList + hardList
            
            for i in 1...numberOfTaskByHumor{
                listOfTasks.append(allTasks[i].objectID.uriRepresentation().absoluteString)
            }
        }
        
    }
    
    userDefaults.set(listOfTasks, forKey: "tasks")
}


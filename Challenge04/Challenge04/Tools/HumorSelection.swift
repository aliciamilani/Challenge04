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

let userDefaults = UserDefaults.standard
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

var listOfTasks: [String] = []

public enum Humor : String {
    case happy = "Happy"
    case confident = "Confident"
    case indifferent = "Indifferent"
    case irritated = "Irritated"
    case tired = "Tired"
    case sad = "Sad"
}

let taskPerHumor: [Humor:Int] =
[.happy: 3,
 .confident: 3,
 .indifferent: 3,
 .irritated: 2,
 .tired: 1,
 .sad: 2]

class HumorSelection {
    var userHumor: Humor?
}

func getHumorFromString(humor: String) -> Humor?{
    switch humor {
    case "Happy": return .happy
    case "Sad": return .sad
    case "Indifferent": return .indifferent
    case "Irritated": return .irritated
    case "Tired": return .tired
    case "Confident": return .confident
    default:
        return nil
    }
}

func getMessage(humor: Humor) -> (String){
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

func getAllItems() {
    do {
        taskModel = try context.fetch(TaskModel.fetchRequest())
    } catch {
        //error
    }
}

func treateItems() {
    for task in taskModel {
        
        if !task.urgency {
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



func getTasksDay(humor: Humor){
    
    var alltasks = [TaskModel]()
    
    getAllItems()
    treateItems()
    
    let qtdeTask = taskPerHumor[humor]!
    
    if taskModel.count != 0 {
        if humor == .happy || humor == .confident{
            alltasks = hardList + mediumList + easyList
            
            for i in 1...qtdeTask{
                listOfTasks.append(alltasks[i].objectID.uriRepresentation().absoluteString)
            }
        }
        
        if humor == .indifferent {
            alltasks = mediumList + hardList + easyList
            
            for i in 1...qtdeTask{
                listOfTasks.append(alltasks[i].objectID.uriRepresentation().absoluteString)
            }
        }
        
        if humor == .irritated || humor == .tired || humor == .sad {
            alltasks = easyList + mediumList + hardList
            
            for i in 1...qtdeTask{
                listOfTasks.append(alltasks[i].objectID.uriRepresentation().absoluteString)
            }
        }
        
    }
    
    userDefaults.set(listOfTasks, forKey: "tasks")
}

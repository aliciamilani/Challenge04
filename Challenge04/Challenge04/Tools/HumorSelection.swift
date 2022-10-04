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
let dicHumor: [String:Int] =
    ["Happy": 3,
     "Confident": 3,
     "Indifferent": 3,
     "Irritated": 2,
     "Tired": 1,
     "Sad": 2]

class HumorSelection {
    var userHumor: String = ""
}

func getMessage(humor: String) -> (String){
    switch(humor){
    case "Happy":
        return "Glad you're happy today! Let's complete the day with some activities?"
        
    case "Confident":
        return "I liked the attitude! Let's rock today!"
        
    case "Indifferent":
        return "Animation, cowboy! You can do it!"
        
    case "Irritated":
        return "Take it easy! I separated some very special activities for you today!"
        
    case "Sad":
        return "Don't worry! I have your back. There are some small activities for today: "
        
    case "Tired":
        return "You'll feel a lot better when you finish today's activities! Let's go"
        
    default:
        return "Here are some activities for you :)"
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



func getTasksDay(humor: String){
    
    var alltasks = [TaskModel]()
    
    getAllItems()
    treateItems()

    let qtdeTask = dicHumor[humor]!
    
    if taskModel.count != 0 {
        if humor == "Happy" || humor == "Confident"{
            alltasks = hardList + mediumList + easyList
            
            for i in 1...qtdeTask{
                listOfTasks.append(alltasks[i].objectID.uriRepresentation().absoluteString)
            }
        }
        
        if humor == "Indifferent" {
            alltasks = mediumList + hardList + easyList
            
            for i in 1...qtdeTask{
                listOfTasks.append(alltasks[i].objectID.uriRepresentation().absoluteString)
            }
        }
        
        if humor == "Irritated" || humor == "Tired" || humor == "Sad"{
            alltasks = easyList + mediumList + hardList
            
            for i in 1...qtdeTask{
                listOfTasks.append(alltasks[i].objectID.uriRepresentation().absoluteString)
            }
        }
        
    }
    
    userDefaults.set(listOfTasks, forKey: "tasks")
}

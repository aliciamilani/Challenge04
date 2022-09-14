//
//  HumorSelection.swift
//  Challenge04
//
//  Created by Victor Santos on 8/16/22.
//

import Foundation
import UIKit
import CoreData

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

private var taskModel = [TaskModel]()
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

func getAllItems() {
    do {
        taskModel = try context.fetch(TaskModel.fetchRequest())
        
    } catch {
        //error
    }
    
}

func getTasksDay(humor: String) -> [TaskModel]{
    var listTasks = [TaskModel]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    getAllItems()
    
    let userDefaults = UserDefaults.standard
    var listOfTasks: [String] = userDefaults.object(forKey: "test") as? [String] ?? []
    
    if taskModel.count != 0 {
        for t in 0 ..< taskModel.count {
            if listTasks.count <= 3 {
                let soma = (taskModel[t].difficulty + taskModel[t].duration)
            
//                print("aqui: ", taskModel[t].objectID)
//                print("aqui2: ", context.object(with: taskModel[t].objectID))
//                print("aqui3: ", taskModel[t].objectID.uriRepresentation().absoluteString)
                if taskModel[t].difficulty == 3 && soma >= 5 && humor == "Happy"{
                    listTasks.append(taskModel[t])
                    taskModel.remove(at: t)
//                    listOfTasks.append(taskModel[t].objectID)
                }
            
                if taskModel[t].difficulty == 3 && humor == "Confident" {
                    listTasks.append(taskModel[t])
                    taskModel.remove(at: t)
//                    listOfTasks.append(taskModel[t].objectID)
                }
                
                if taskModel[t].duration == 3 && soma == 5 && humor == "Confident"{
                    listTasks.append(taskModel[t])
                    taskModel.remove(at: t)
//                    listOfTasks.append(taskModel[t].objectID)
                }
                
                if taskModel[t].difficulty == 1 && soma == 4 && humor == "Indifferent"{
                    listTasks.append(taskModel[t])
                    taskModel.remove(at: t)
//                    listOfTasks.append(taskModel[t].objectID)
                }
                
                if soma == 4 && humor == "Irritated"{
                    listTasks.append(taskModel[t])
                    taskModel.remove(at: t)
//                    listOfTasks.append(taskModel[t].objectID)
                }
                
                if taskModel[t].difficulty == 2 && soma == 3 && humor == "Tired"{
                    listTasks.append(taskModel[t])
                    taskModel.remove(at: t)
//                    listOfTasks.append(taskModel[t].objectID)
                }
                
                if soma == 3 && humor == "Sad"{
                    listTasks.append(taskModel[t])
                    taskModel.remove(at: t)
//                    listOfTasks.append(taskModel[t].objectID)
                }
                
                if soma == 2 && humor == "Tired"{
                    listTasks.append(taskModel[t])
                    taskModel.remove(at: t)
//                    listOfTasks.append(taskModel[t].objectID)
                }
            }
        }
        
        let difference = 3 - listTasks.count
        var elements: [Int] = []
            
        if difference != 0 && taskModel.count != 0 {
            var i = 0
            while i < difference{
                let num = Int.random(in: 0...taskModel.count - 1)
                if !elements.contains(num){
                    elements.append(num)
                    listTasks.append(taskModel[num])
                    let a = taskModel[num].objectID.uriRepresentation().absoluteString
                    listOfTasks.append(a)
                }
                
                i += 1
            }
        }
    }
    
    print("como ta: ", listOfTasks)
    
    userDefaults.set(listOfTasks, forKey: "test")
    
    return listTasks
}

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

func getTasksDay(humor: String){
    var listTasks = [TaskModel]()
    
    getAllItems()
    
    let userDefaults = UserDefaults.standard
    var listOfTasks: [String] = userDefaults.object(forKey: "tasks") as? [String] ?? []
    
    var j = 0
    
    let dicHumor: [String:Int] = ["Happy": 3, "Confident": 3, "Indifferent": 3, "Irritated": 2, "Tired": 1, "Sad": 2]
    
    let qtdeTask = dicHumor[humor]!

    if taskModel.count != 0 {
        for i in taskModel {
            if listTasks.count < qtdeTask {
                
                let soma = (i.difficulty + i.duration)
            
                if i.difficulty == 3 && soma >= 5 && humor == "Happy"{
                    listTasks.append(i)
                    taskModel.remove(at: j)
                    listOfTasks.append(i.objectID.uriRepresentation().absoluteString)
                }
            
                if i.difficulty == 3 && humor == "Confident" {
                    listTasks.append(i)
                    taskModel.remove(at: j)
                    listOfTasks.append(i.objectID.uriRepresentation().absoluteString)
                }
                
                if i.duration == 3 && soma == 5 && humor == "Confident"{
                    listTasks.append(i)
                    taskModel.remove(at: j)
                    listOfTasks.append(i.objectID.uriRepresentation().absoluteString)
                }
                
                if i.difficulty == 1 && soma == 4 && humor == "Indifferent"{
                    listTasks.append(i)
                    taskModel.remove(at: j)
                    listOfTasks.append(i.objectID.uriRepresentation().absoluteString)
                }
                
                if soma == 4 && humor == "Irritated"{
                    listTasks.append(i)
                    taskModel.remove(at: j)
                    listOfTasks.append(i.objectID.uriRepresentation().absoluteString)
                }
                
                if i.difficulty == 2 && soma == 3 && humor == "Tired"{
                    listTasks.append(i)
                    taskModel.remove(at: j)
                    listOfTasks.append(i.objectID.uriRepresentation().absoluteString)
                }
                
                if soma == 3 && humor == "Sad"{
                    listTasks.append(i)
                    taskModel.remove(at: j)
                    listOfTasks.append(i.objectID.uriRepresentation().absoluteString)
                }
                
                if soma == 2 && humor == "Tired"{
                    listTasks.append(i)
                    taskModel.remove(at: j)
                    listOfTasks.append(i.objectID.uriRepresentation().absoluteString)
                }
            }
            
            j += 1
        }
                
        let difference = qtdeTask - listTasks.count
        var elements: [Int] = []
            
        if difference != 0 && taskModel.count != 0 {
            var i = 0
            while i < difference{
                let num = Int.random(in: 0...taskModel.count - 1)
                if !elements.contains(num){
                    elements.append(num)
                    listTasks.append(taskModel[num])
                    listOfTasks.append(taskModel[num].objectID.uriRepresentation().absoluteString)
                }
                
                i += 1
            }
        }
    }
    
    userDefaults.set(listOfTasks, forKey: "tasks")
}

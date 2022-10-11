//
//  CoreDataFunctions.swift
//  GoMoo
//
//  Created by Anna Alicia Milani on 03/10/22.
//

import Foundation
import UIKit

public class CoreDataFunctions {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    init() {}
    
    public func deleteTask(item: TaskModel){
        context.delete(item)
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    public func addHumor(humor: HumorTypes){
        
        let newHumor = HumorModel(context: context)
        newHumor.data = Date()
        newHumor.humor = humor.rawValue
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    public func addTask(title: String, difficulty: Int, duration: Int, goal: CategoryTypes, category: CategoryTypes, descrip: String, isUrgent: Bool){
        
        let newTask = TaskModel(context: context)
        newTask.title = title
        newTask.difficulty = Int16(difficulty)
        newTask.duration = Int16(duration)
        newTask.goal = Int16(goal.rawValue)
        newTask.category = Int16(category.rawValue)
        newTask.descrip = descrip
        newTask.isUrgent = isUrgent
        
        do {
            try context.save()
        } catch {
        }
    }
    
    
    func updateTitleTask(taskModel: TaskModel, newTitle: String){
        
        taskModel.title = newTitle
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    func updateDescripTask(taskModel: TaskModel, newDescrip: String){
        
        taskModel.descrip = newDescrip
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    func updateUrgecyTask(taskModel: TaskModel, changeUrgency: Bool){
        
        taskModel.isUrgent = changeUrgency
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
}

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
    
    public func deleteItem(item: TaskModel){
        context.delete(item)

        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    public func createItem(title: String, difficulty: Int, duration: Int, goal: CategoryTypes, category: CategoryTypes, descrip: String, urgency: Bool){
        let newItem = TaskModel(context: context)
        newItem.title = title
        newItem.difficulty = Int16(difficulty)
        newItem.duration = Int16(duration)
        newItem.goal = goal.rawValue
        newItem.category = category.rawValue
        newItem.descrip = descrip
        newItem.urgency = urgency
    
        do {
            try context.save()
        } catch {
        }
    }
    
    func updateDuration(taskModel: TaskModel, newDuration: Int){
        
        taskModel.duration = Int16(newDuration)
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    func updateDifficulty(taskModel: TaskModel, newDifficulty: Int){
        
        taskModel.difficulty = Int16(newDifficulty)
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    func updateTitle(taskModel: TaskModel, newTitle: String){
        
        taskModel.title = newTitle
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    func updateDescrip(taskModel: TaskModel, newDescrip: String){
        
        taskModel.descrip = newDescrip
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    func updateUrgency(taskModel: TaskModel, newUrgency: Bool){
        
        taskModel.urgency = newUrgency
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
}

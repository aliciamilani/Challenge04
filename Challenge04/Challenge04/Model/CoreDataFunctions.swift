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
    
    public func saveHumor(humor: HumorTypes){
        
        let newItem = HumorModel(context: context)
        newItem.data = Date()
        newItem.humor = humor.rawValue
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
    public func createItem(title: String, difficulty: Int, duration: Int, goal: CategoryTypes, category: CategoryTypes, descrip: String, isUrgent: Bool){
        let newItem = TaskModel(context: context)
        newItem.title = title
        newItem.difficulty = Int16(difficulty)
        newItem.duration = Int16(duration)
        newItem.goal = goal.rawValue
        newItem.category = category.rawValue
        newItem.descrip = descrip
        newItem.isUrgent = isUrgent
        
        do {
            try context.save()
        } catch {
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
    
    func updateUrgecy(taskModel: TaskModel, changeUrgency: Bool){
        
        taskModel.isUrgent = changeUrgency
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
    
}

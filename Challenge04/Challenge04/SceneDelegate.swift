//
//  SceneDelegate.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import UIKit
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var humorModel = [HumorModel]()
    let userDefaults = UserDefaults.standard
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func preloadData() {
        
        let preloadedDataKey = "didPreloadData"
            
        guard let urlPath = Bundle.main.url(forResource: "PreloadedData", withExtension: "plist") else {
            return
        }

        let backgroundContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.newBackgroundContext()

        
        backgroundContext.perform {
            if let arrayContent = NSArray(contentsOf: urlPath) as? [Array<String>] {

                do {
                    
                    for item in arrayContent {
                        let taskModelObject = TaskModel(context: backgroundContext)
                        taskModelObject.category = Int16(item[0])!
                        taskModelObject.goal = Int16(item[1])!
                        taskModelObject.title = item[2]
                        taskModelObject.difficulty = Int16(item[3])!
                        taskModelObject.duration = Int16(item[4])!
                        taskModelObject.points = Float(item[5])!
                        taskModelObject.descrip = item[6]
                        taskModelObject.urgency = Bool(item[7]) ?? false
                    }
                    
                    try backgroundContext.save()
                    self.userDefaults.set(true, forKey: preloadedDataKey)
                    
                } catch {
                    
                }
            }
        }
    }
    
    func deleteAllData(entity: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false

        do
        {
            let results = try managedContext.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                managedContext.delete(managedObjectData)
            }
        } catch let error as NSError {
            print("Delete all data in \(entity) error : \(error) \(error.userInfo)")
        }
    }

    
    private func checkHumorDay() -> Bool {
        humorModel = [HumorModel]()
        do {
            humorModel = try context.fetch(HumorModel.fetchRequest())

            for humor in humorModel{
                if Calendar.current.isDateInToday(humor.data ?? Date()) {
                    return true
                }
            }
            return false
            
        } catch {
            //error
        }
        
        return false
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if userDefaults.bool(forKey: "addNewFunc") != true {
            
            deleteAllData(entity: "TaskModel")
            
            preloadData()
            
            userDefaults.set(true, forKey: "addNew")
        }
        
        if checkHumorDay(){
            let storyboard = UIStoryboard(name: "DailyTasks", bundle: .main)
            let vc = storyboard.instantiateViewController(identifier: "tabStory")
            self.window?.rootViewController = vc
            
        } else {
            let defaults = UserDefaults.standard
            defaults.set(true, forKey: "goalsButton")
            
            if humorModel.count == 0 {
                let storyboard = UIStoryboard(name: "Goals", bundle: .main)
                let vc = storyboard.instantiateViewController(withIdentifier: "goalsStory")
                self.window?.rootViewController = UINavigationController(rootViewController: vc)
                
            } else {
                
                let storyboard = UIStoryboard(name: "HumorView", bundle: .main)
                let vc = storyboard.instantiateViewController(withIdentifier: "humorStory")
                self.window?.rootViewController = UINavigationController(rootViewController: vc)
                
            }
            
        }
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


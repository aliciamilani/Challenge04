//
//  Task.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 16/08/22.
//

import Foundation

class Task {
    var cod: String
    var title : String
    var description : String
    var priority : Int
    var category: CategoryTypes
    var codGoal: Goal
    
    init(title: String, description: String, priority: Int, category: CategoryTypes, codGoal: Goal){
        self.cod = UUID().uuidString
        self.title = title
        self.description = description
        self.priority = priority
        self.category = category
        self.codGoal = codGoal
    }
    
    init(){
        self.cod = UUID().uuidString
        self.title = ""
        self.description = ""
        self.priority = -1
        self.category = .hobby
        self.codGoal = Goal()
    }
}

enum CategoryTypes {
    case hobby, education
}

func getTasks() -> ([Task]){
    
    let goal1 = Goal(title: "Matemática")
    let goal2 = Goal(title: "Instrumentos")
    let goal3 = Goal(title: "Leitura")
    
    let tasksArray = [
        Task(title: "Estudar para prova de matemática", description: "Devo acessar o portal da escola e pegar os slides", priority: 1, category: .education, codGoal: goal1),
        Task(title: "Praticar piano", description: "Ligar para o professor e marcar aulas", priority: 2, category: .education, codGoal: goal2),
        Task(title: "Adiantar leitura do paradidático do próximo ano", description: "Ir a biblioteca", priority: 3, category: .education, codGoal: goal3),
    ]
    
    return tasksArray

}

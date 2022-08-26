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
    
    var priority : Int
    var dificulty : Int
    var timeForExecution: Int
    var points: Float
    
    var category: CategoryTypes
    
    var codGoal: Goal
    
    init(title: String, priority: Int, dificulty: Int, timeForExecution: Int, category: CategoryTypes, codGoal: Goal){
        self.cod = UUID().uuidString
        self.title = title
        self.priority = priority
        self.dificulty = dificulty
        self.timeForExecution = timeForExecution
        // calculate priority
        self.points = Float(priority * dificulty * timeForExecution)
        self.category = category
        self.codGoal = codGoal
    }
    
    init(){
        self.cod = UUID().uuidString
        self.title = ""
        self.priority = -1
        self.dificulty = -1
        self.timeForExecution = -1
        self.points = 0
        self.category = .hobby
        self.codGoal = Goal()
    }
}

enum CategoryTypes {
    case hobby, education
}

func getTasks() -> ([Task]){
    
    let goalMatematica = Goal(title: "Matemática")
    let goalInstrumentos = Goal(title: "Instrumentos")
    let goalLeitura = Goal(title: "Leitura")
    let goalJogos = Goal(title: "Jogos")
    let goaLSaude = Goal(title: "Saúde")
    
    let tasksArray = [
        Task(
            title: "Study outstanding math subjects",
            priority: 3,
            dificulty: 2,
            timeForExecution: 2,
            category: .education,
            codGoal: goalMatematica
        ),
        
        Task(
            title: "Practice piano",
            priority: 2,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goalInstrumentos
        ),
        
        Task(
            title: "Advance reading of next year's paradidactic",
            priority: 1,
            dificulty: 1,
            timeForExecution: 3,
            category: .education,
            codGoal: goalLeitura
        ),
        
        Task(
            title: "Play new X game update",
            priority: 2,
            dificulty: 1,
            timeForExecution: 3,
            category: .hobby,
            codGoal: goalJogos
        ),
        
        Task(
            title: "Send email to Mr. Beto",
            priority: 3,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goalInstrumentos
        ),
        
        Task(
            title: "Find new kindle cover.",
            priority: 1,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goalLeitura
        ),
        
        Task(
            title: "Search new sunscreen",
            priority: 3,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goaLSaude
        ),
        
        Task(
            title: "Update notes",
            priority: 2,
            dificulty: 1,
            timeForExecution: 2,
            category: .education,
            codGoal: goalMatematica
        ),
        
        Task(
            title: "Change guitar string",
            priority: 2,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goalInstrumentos
        ),
        
        Task(
            title: "Reset Y game",
            priority: 2,
            dificulty: 3,
            timeForExecution: 3,
            category: .hobby,
            codGoal: goalJogos
        ),
    ]
    
    return tasksArray

}

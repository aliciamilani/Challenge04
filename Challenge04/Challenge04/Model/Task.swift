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
    var dificulty : Int
    var timeForExecution: Int
    var points: Float
    
    var category: CategoryTypes
    
    var codGoal: Goal
    
    init(title: String, description: String, priority: Int, dificulty: Int, timeForExecution: Int, category: CategoryTypes, codGoal: Goal){
        self.cod = UUID().uuidString
        self.title = title
        self.description = description
        self.priority = priority
        self.dificulty = dificulty
        self.timeForExecution = timeForExecution
        self.points = Float(priority * dificulty * timeForExecution)
        self.category = category
        self.codGoal = codGoal
    }
    
    init(){
        self.cod = UUID().uuidString
        self.title = ""
        self.description = ""
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
            description: "I must access the school portal and get the slides.",
            priority: 3,
            dificulty: 2,
            timeForExecution: 2,
            category: .education,
            codGoal: goalMatematica
        ),
        
        Task(
            title: "Practice piano",
            description: "Call the teacher and schedule classes.",
            priority: 2,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goalInstrumentos
        ),
        
        Task(
            title: "Advance reading of next year's paradidactic",
            description: "Go to the library.",
            priority: 1,
            dificulty: 1,
            timeForExecution: 3,
            category: .education,
            codGoal: goalLeitura
        ),
        
        Task(
            title: "Play new X game update",
            description: "Visit the AppStore.",
            priority: 2,
            dificulty: 1,
            timeForExecution: 3,
            category: .hobby,
            codGoal: goalJogos
        ),
        
        Task(
            title: "Send email to Mr. Beto",
            description: "Check for available guitar classes.",
            priority: 3,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goalInstrumentos
        ),
        
        Task(
            title: "Find new kindle cover.",
            description: "My cover is damaged and I need a new one.",
            priority: 1,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goalLeitura
        ),
        
        Task(
            title: "Search new sunscreen",
            description: "Look for another protector that doesn't make me allergic.",
            priority: 3,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goaLSaude
        ),
        
        Task(
            title: "Update notes",
            description: "Pick up the topic I missed.",
            priority: 2,
            dificulty: 1,
            timeForExecution: 2,
            category: .education,
            codGoal: goalMatematica
        ),
        
        Task(
            title: "Change guitar string",
            description: "Change strings for when I want to play.",
            priority: 2,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goalInstrumentos
        ),
        
        Task(
            title: "Reset Y game",
            description: "It's just talked about.",
            priority: 2,
            dificulty: 3,
            timeForExecution: 3,
            category: .hobby,
            codGoal: goalJogos
        ),
    ]
    
    return tasksArray

}

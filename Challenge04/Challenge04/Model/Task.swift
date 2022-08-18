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
            title: "Estudar assuntos pendentes de matemática",
            description: "Devo acessar o portal da escola e pegar os slides.",
            priority: 3,
            dificulty: 2,
            timeForExecution: 2,
            category: .education,
            codGoal: goalMatematica
        ),
        
        Task(
            title: "Praticar piano",
            description: "Ligar para o professor e marcar aulas.",
            priority: 2,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goalInstrumentos
        ),
        
        Task(
            title: "Adiantar leitura do paradidático do próximo ano",
            description: "Ir a biblioteca.",
            priority: 1,
            dificulty: 1,
            timeForExecution: 3,
            category: .education,
            codGoal: goalLeitura
        ),
        
        Task(
            title: "Jogar nova atualização do jogo X",
            description: "Ir na AppStore.",
            priority: 2,
            dificulty: 1,
            timeForExecution: 3,
            category: .hobby,
            codGoal: goalJogos
        ),
        
        Task(
            title: "Mandar email para Sr. Beto",
            description: "Verificar se há turmas disponíveis de violão.",
            priority: 3,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goalInstrumentos
        ),
        
        Task(
            title: "Procurar nova capa para kindle",
            description: "Minha capa danificou e preciso de uma nova.",
            priority: 1,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goalLeitura
        ),
        
        Task(
            title: "Pesquisar novo protetor solar",
            description: "Procurar por outro protetor que não me de alergia.",
            priority: 3,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goaLSaude
        ),
        
        Task(
            title: "Passar a limpo anotações",
            description: "Pegar assunto que faltei.",
            priority: 2,
            dificulty: 1,
            timeForExecution: 2,
            category: .education,
            codGoal: goalMatematica
        ),
        
        Task(
            title: "Trocar corda da guitarra",
            description: "Trocar para quando quiser tocar.",
            priority: 2,
            dificulty: 1,
            timeForExecution: 1,
            category: .hobby,
            codGoal: goalInstrumentos
        ),
        
        Task(
            title: "Zerar jogo Y",
            description: "Só se fala nisso.",
            priority: 2,
            dificulty: 3,
            timeForExecution: 3,
            category: .hobby,
            codGoal: goalJogos
        ),
    ]
    
    return tasksArray

}

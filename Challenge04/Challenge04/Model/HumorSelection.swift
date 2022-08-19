//
//  HumorSelection.swift
//  Challenge04
//
//  Created by Victor Santos on 8/16/22.
//

import Foundation
import UIKit

class HumorSelection {
    var userHumor: String = ""
    
}

func getMessage(humor: String) -> (String){
    switch(humor){
    case "Happy":
        return "Glad you're happy today! Shall we complete the day with some activities?"
        
    case "Confident":
        return "I liked the attitude! Shall we rock today?"
        
    case "Indifferent":
        return "Animation, cowboy! You can do it!"
        
    case "Irritated":
        return "Take it easy! I separated some very special activities for you today!"
        
    case "Sad":
        return "Don't worry! I have your back. Here are small activities for today: "
        
    case "Tired":
        return "You'll feel a lot better when you finish today's activities! Let's go"
        
    default:
        return "Here are some activities for you"
    }
}

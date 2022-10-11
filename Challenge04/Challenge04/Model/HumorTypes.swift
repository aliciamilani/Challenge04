//
//  Humor.swift
//  GoMoo
//
//  Created by Anna Alicia Milani on 11/10/22.
//

import Foundation

public enum HumorTypes : String {
    case happy = "Happy"
    case confident = "Confident"
    case indifferent = "Indifferent"
    case irritated = "Irritated"
    case tired = "Tired"
    case sad = "Sad"
}

public func getHumorFromString(humor: String) -> HumorTypes?{
    switch humor {
    case "Happy": return .happy
    case "Sad": return .sad
    case "Indifferent": return .indifferent
    case "Irritated": return .irritated
    case "Tired": return .tired
    case "Confident": return .confident
    default:
        return nil
    }
}

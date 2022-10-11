//
//  Date+getFormattedDate.swift
//  GoMoo
//
//  Created by Anna Alicia Milani on 11/10/22.
//

import Foundation

extension Date {
    func getFormattedDate() -> String {
        
        let currentLocale:Locale = NSLocale(localeIdentifier: Locale.preferredLanguages.first!) as Locale
        let currentDate =  Date()
        
        let stringDate = currentDate.formatted(.dateTime
            .day(.twoDigits)
            .month(.wide)
            .weekday(.short)
            .locale(currentLocale))
        
        let thedate = "\(stringDate)"
        return thedate
        
        
    }
}



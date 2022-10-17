//
//  Date+getFormattedDate.swift
//  GoMoo
//
//  Created by Anna Alicia Milani on 11/10/22.
//

import Foundation

extension Date {
    func getFormattedDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        let date = Date()

        let currentLocale = NSLocale(localeIdentifier: Locale.preferredLanguages.first!) as Locale
        dateFormatter.locale = currentLocale
        
//        let currentDate =  Date()
//
//        let stringDate = currentDate.formatted(.dateTime
//            .day(.twoDigits)
//            .month(.wide)
//            .weekday(.short)
//            .locale(currentLocale))
//
//        let thedate = "\(stringDate)"
        
        return dateFormatter.string(from: date)
        
    }
}



//
//  DateExtension.swift
//  MyWorkout
//
//  Created by Tham Thearawiboon on 19/9/2564 BE.
//

import Foundation

extension Date {
    func formatted(as format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func isSameDay(as day: Date) -> Bool {
        yearMonthDay == day.yearMonthDay
    }
    
    var yearMonthDay: String {
        formatted(as: "yyyy MM dd")
    }
}

//
//  Date+ValueExtraction.swift
//  UtilityCoreKit
//
//  ReCreated by Ofir Ron on 28/01/2025.
//  Created by Ofir Ron on 25/12/2024.
//

import Foundation

// TODO: Add test for this and use hours, 09, 17 and also change lanagues and locle all should be in english

// MARK: - Date+ValueExtraction.swift
// This extension adds methods to extract specific values from a Date object.

extension Date {
    /// Returns the full weekday name (e.g., "Sunday", "Monday").
    public var weekday: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        return dateFormatter.string(from: self)
    }

    /// Returns the date in the "MM/dd/yyyy" format (e.g., "11/17/2024").
    public var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        return dateFormatter.string(from: self)
    }

    public var dateAndTimeComponents: (year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) {
        get throws {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
            guard let year = components.year,
                  let month = components.month,
                  let day = components.day,
                  let hour = components.hour,
                  let minute = components.minute,
                  let second = components.second
            else {
                throw NotImplementedError("Failed to split date to components")
            }

            return (year, month, day, hour, minute, second)
        }
    }

    /// Returns the time in the "HH:mm" format (e.g., "17:09", "09:55").
    public var timeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        // dateFormatter.calendar = Calendar(identifier: .gregorian)
        return dateFormatter.string(from: self)
    }
}

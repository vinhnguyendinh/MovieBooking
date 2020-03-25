//
//  DateExt.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/25.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import Foundation

extension Date {
    static var currentYear: Int {
        let dateString = getDateComponent(date: Date(), format: "yyyy")
        if let year = Int(dateString) {
            return year
        }
        return 0
    }

    private static func getDateComponent(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = .autoupdatingCurrent
        return dateFormatter.string(from: date)
    }

    static func getFollowingThirtyDays(for month: Int = 1) -> [TicketDate] {
        var ticketDates: [TicketDate] = []

        let dateComponents = DateComponents(year: currentYear , month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!

        for i in range {
            guard let fullDate = calendar.date(byAdding: DateComponents(day: i) , to: Date()) else { continue }
            let d = getDateComponent(date: fullDate, format: "dd")
            let m = getDateComponent(date: fullDate, format: "MM")
            let y = getDateComponent(date: fullDate, format: "yyyy")
            let ticketDate = TicketDate(day: d, month: m, year: y)
            ticketDates.append(ticketDate)
        }

        return ticketDates
    }

    static func getTicketTime() -> [TicketTime] {
        return (1...24).map({
            return TicketTime(hour: "\($0)", minute: "00")
        })
    }
}

//
//  TicketDate.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/25.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import Foundation

struct TicketDate: Equatable {
    var day: String
    var month: String
    var year: String

    static let `default` = TicketDate(day: "20", month: "10", year: "2019")

    static func == (lhs: TicketDate, rhs: TicketDate) -> Bool {
        return lhs.year == rhs.year &&
            lhs.month == rhs.month &&
            lhs.day == rhs.day
    }
}

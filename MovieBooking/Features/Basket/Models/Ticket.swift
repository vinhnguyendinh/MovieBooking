//
//  Ticket.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/26.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import Foundation

struct Ticket<T: Movie>: Identifiable {
    var id: UUID
    var movie: T
    var date: TicketDate
    var time: TicketTime

    static var `default`: Ticket<Trending> {
        .init(id: UUID(), movie: Trending.default, date: TicketDate.default, time: TicketTime.default)
    }
}

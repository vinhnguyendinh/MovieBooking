//
//  TicketTime.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/25.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import Foundation

struct TicketTime: Equatable {
    var hour: String
    var minute: String

    static var `default` = TicketTime(hour: "10", minute: "20")
}

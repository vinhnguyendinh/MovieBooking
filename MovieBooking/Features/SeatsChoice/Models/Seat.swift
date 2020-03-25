//
//  Seat.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/25.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import Foundation

struct Seat: Identifiable {
    var id: UUID
    var row: Int
    var number: Int

    static var `default` = Seat(id: UUID(), row: 0, number: 0)
}

//
//  AnyTransitionExt.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/26.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var hearbeat: AnyTransition {
        return AnyTransition
            .scale(scale: 1.7)
            .combined(with: .scale(scale: 1))
    }
}

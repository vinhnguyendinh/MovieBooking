//
//  DashedSeperator.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/26.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct DashedSeperator: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.origin.x, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.origin.y ))
        path.closeSubpath()
        return path
    }
}

struct DashedSeperator_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DashedSeperator()
        }
    }
}

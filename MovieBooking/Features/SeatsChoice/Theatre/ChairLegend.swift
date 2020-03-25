//
//  ChairLegend.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/25.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct ChairLegend: View {
    var legendText: String

    var accentColor: Color

    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ChairView(seat: Seat.default, width: 20, isSelectable: false, accentColor: self.accentColor)

            Text(self.legendText)
                .foregroundColor(self.accentColor)
        }
    }
}

struct ChairLegend_Previews: PreviewProvider {
    static var previews: some View {
        ChairLegend(legendText: "Selected", accentColor: .blue)
    }
}

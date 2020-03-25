//
//  TimeView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/25.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct TimeView: View {
    var ticketTime: TicketTime

    var isSelected: Bool

    var onSelect: ((_ ticketTime: TicketTime) -> Void) = {_ in}

    var body: some View {
        VStack {
            Text("\(ticketTime.hour):\(ticketTime.minute)")
                .font(.callout)
                .foregroundColor(isSelected ? .white : .textColor)
        }
        .padding()
        .background(isSelected ? Color.accent : Color.gray.opacity(0.3))
        .cornerRadius(10)
        .onTapGesture {
            self.onSelect(self.ticketTime)
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView(ticketTime: TicketTime.default, isSelected: false)
    }
}

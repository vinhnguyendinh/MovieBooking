//
//  DateView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/25.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct DateView: View {
    var ticketDate: TicketDate

    var isSelected: Bool

    var onSelect: ((_ ticketDate: TicketDate) -> Void) = {_ in}

    var body: some View {
        VStack {
            Text(ticketDate.day)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(isSelected ? .white : .textColor)

            Text("\(ticketDate.month)/\(ticketDate.year)")
                .foregroundColor(isSelected ? .white : .textColor)
                .font(.callout)
                .padding(.top, 10)
        }
        .padding()
        .background(isSelected ? Color.accent : Color.gray.opacity(0.3))
        .cornerRadius(10)
        .clipShape(DateShape(cutRadius: 5))
        .onTapGesture {
            self.onSelect(self.ticketDate)
        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(ticketDate: TicketDate.default, isSelected: false)
    }
}

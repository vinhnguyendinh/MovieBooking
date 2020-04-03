//
//  TicketView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/26.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct TicketView<T: Movie>: View {
    var ticket: Ticket<T>

    var seat: Seat = Seat.default

    var body: some View {
        VStack(spacing: 0) {
            TopTicketView(ticket: ticket, seat: seat)
                .background(Color.background)
                .clipShape(TicketShape())
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)

            DashedSeperator()
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 1,dash: [4,8], dashPhase: 4))
                .frame(height: 0.4)
                .padding(.horizontal)

            BottomTicketView()
                .background(Color("barcodeBG"))
                .clipShape(TicketShape().rotation(Angle(degrees: 180)))
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
        }.padding()
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView(ticket: Ticket<Trending>.default, seat: Seat.default)
    }
}

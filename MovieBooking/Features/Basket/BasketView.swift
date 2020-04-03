//
//  BasketView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/26.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct BasketView<T: Movie>: View {
    var ticket: Ticket<T>

    var selectedSeats: [Seat]

    @State private var showPaymentScreen = false

    var body: some View {
        VStack(spacing: 0) {
            createTicketList()

            LCButton(text: "Buy", action: { self.showPaymentScreen.toggle() })
                .padding(.horizontal)
                .padding(.bottom)
        }
        .sheet(isPresented: self.$showPaymentScreen) {
            PaymentView()
        }
    }

    fileprivate func createTicketList() -> some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(self.selectedSeats) { seat in
                    GeometryReader { gr in
                        self.renderTicket(
                            ticket: self.ticket,
                            seat: seat,
                            angle: gr.frame(in: .global).minX / -10
                        )
                    }
                    .frame(width: UIScreen.main.bounds.width)
                }
            }
        }
    }

    func renderTicket(ticket: Ticket<T>, seat: Seat, angle: CGFloat) -> some View {
        return TicketView(ticket: ticket, seat: seat)
            .rotation3DEffect(Angle(degrees: Double(angle)) , axis: (x: 0, y: 10.0, z: 0))
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(ticket: Ticket<Popular>.default, selectedSeats: [])
    }
}

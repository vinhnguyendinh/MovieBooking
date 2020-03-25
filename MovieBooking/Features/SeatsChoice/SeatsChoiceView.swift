//
//  SeatsChoiceView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/25.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct SeatsChoiceView<T: Movie>: View {
    var movie: T

    @State private var selectedSeats: [Seat] = []
    @State private var showBasket: Bool = false
    @State private var date: TicketDate = TicketDate.default
    @State private var time: TicketTime = TicketTime.default
    @State private var showPopup = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TheatreView(selectedSeats: self.$selectedSeats)

                    DateTimeView(ticketDateList: Date.getFollowingThirtyDays(),
                                 ticketTimeList: Date.getTicketTime(),
                                 dateSelected: self.$date,
                                 timeSelected: self.$time)
                    
                    createContinueButton()
                }
                .padding()
                .navigationBarTitle("Choose seats")
            }
        }
    }

    fileprivate func createContinueButton() -> some View {
        return LCButton(text: "Continue") {
        }
    }
}

struct SeatsChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsChoiceView(movie: Popular.default)
    }
}

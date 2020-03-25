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
                    
                    self.createContinueButton()
                }
                .padding()
                .navigationBarTitle("Choose seats")
            }
        }
        .sheet(isPresented: self.$showBasket) {
            Text("Implementing")
        }
        .blur(radius: self.showPopup ? 10 : 0)
        .overlay(
            VStack{
                if self.showPopup {
                    self.createPopupContent()
                } else {
                    EmptyView()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background( self.showPopup ? Color.background.opacity(0.3) : .clear)
        )
    }

    fileprivate func createContinueButton() -> some View {
        return LCButton(text: "Continue") {
            let isValidateInput = self.validateInputs()
            self.showPopup = !isValidateInput
            self.showBasket = isValidateInput
        }
    }

    fileprivate func createPopupContent() -> some View {
        VStack {
            Text("Not allowed")
                .font(.system(size: 20, weight: Font.Weight.semibold))

            Text("You need to select at least one seat, a date and hour in order to continue.")
                .multilineTextAlignment(.center).frame(maxHeight: .infinity)

            LCButton(text: "Ok") {
                withAnimation {
                    self.showPopup.toggle()
                }
            }
        }.frame(width: UIScreen.main.bounds.width * 0.8, height: 200, alignment: .bottom)
            .padding()
            .background(Color.background.opacity(0.7))
            .cornerRadius(20)
            .shadow(color: Color.textColor.opacity(0.3), radius: 20, x: 0, y: 10)
            .transition(.move(edge: .bottom))
    }

    fileprivate func validateInputs() -> Bool {
        return !self.selectedSeats.isEmpty &&
            self.date != TicketDate.default &&
            self.time != TicketTime.default
    }
}

struct SeatsChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsChoiceView(movie: Popular.default)
    }
}

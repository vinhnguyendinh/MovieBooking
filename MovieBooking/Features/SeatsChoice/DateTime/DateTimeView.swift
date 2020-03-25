//
//  DateTimeView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/25.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct DateTimeView: View {
    var ticketDateList: [TicketDate]
    var ticketTimeList: [TicketTime]

    @Binding var dateSelected: TicketDate
    @Binding var timeSelected: TicketTime

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            createDateView()
            createTimeView()
        }
    }

    fileprivate func createDateView() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Dates")
                .font(.title)
                .fontWeight(.bold)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 5) {
                    ForEach(self.ticketDateList, id: \.day) { ticketDate in
                        DateView(ticketDate: ticketDate, isSelected: self.dateSelected == ticketDate) { date in
                            self.dateSelected = date
                        }
                    }
                }
            }
        }
    }

    fileprivate func createTimeView() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Times")
                .font(.title)
                .fontWeight(.bold)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 5) {
                    ForEach(self.ticketTimeList, id: \.hour) { ticketTime in
                        TimeView(ticketTime: ticketTime, isSelected: self.timeSelected == ticketTime) { time in
                            self.timeSelected = time
                        }
                    }
                }
            }
        }
    }
    
}

struct DateTimeView_Previews: PreviewProvider {
    static var previews: some View {
        DateTimeView(ticketDateList: [TicketDate.default],
                     ticketTimeList: [TicketTime.default],
                     dateSelected: .constant(TicketDate.default),
                     timeSelected: .constant(TicketTime.default))
    }
}

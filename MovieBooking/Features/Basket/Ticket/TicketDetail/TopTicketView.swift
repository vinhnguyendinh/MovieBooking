//
//  TopTicketView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/26.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct TopTicketView<T: Movie>: View {
    var ticket: Ticket<T>
    var seat = Seat.default

    var body: some View {
        VStack {
            createMovieInfoView()
            createMovieImage()
            createTicketDetailView()
        }
    }

    fileprivate func createMovieInfoView() -> some View {
        VStack(alignment: .leading) {
            Text(ticket.movie.studio ?? "Unknown")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color.gray)
            Text(ticket.movie.title)
                .font(.system(size: 30, weight: .black))
        }
        .frame(minWidth: 0.0, maxWidth: .infinity, alignment: .leading)
        .padding(.top, 30)
        .padding(.horizontal)
    }

    fileprivate func createMovieImage() -> some View {
        return Image(uiImage: UIImage(named: "\(ticket.movie.image)_land.jpg") ?? UIImage())
            .resizable()
            .frame(minWidth: 0.0, maxWidth: .infinity)
            .scaledToFit()
    }

    fileprivate func createTicketDetailView() -> some View {
        HStack {
            TicketDetailView(
                detail1: "SCREEN",
                detail2: "18",
                detail3: "PRICE",
                detail4: "$5.68"
            )
            TicketDetailView(
                detail1: "ROW",
                detail2: "\(seat.row)",
                detail3: "DATE",
                detail4: "\(ticket.date.day)/\(ticket.date.month)/\(ticket.date.year)"
            )
            TicketDetailView(
                detail1: "SEAT",
                detail2: "\(seat.number)",
                detail3: "TIME",
                detail4: ticket.time.hour
            )
        }.padding(.vertical)
    }
}

struct TopTicketView_Previews: PreviewProvider {
    static var previews: some View {
        TopTicketView(ticket: Ticket<Trending>.default)
    }
}

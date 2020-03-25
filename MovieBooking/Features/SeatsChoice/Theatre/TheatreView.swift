//
//  TheatreView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/25.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct TheatreView: View {
    @Binding var selectedSeats: [Seat]

    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.darkPurple.opacity(0.3), .clear]) , startPoint: .init(x: 0.5, y: 0.0), endPoint: .init(x: 0.5, y: 0.5)) )
                .frame(height: 420)
                .clipShape(ScreenShape(isClip: true))
                .cornerRadius(20)

            ScreenShape()
                .stroke(style: StrokeStyle(lineWidth: 5,  lineCap: .square))
                .foregroundColor(Color.accent)
                .frame(height: 420)

            VStack {
                createFrontViews()
                createBackViews()
                createSeatLegends()
            }
        }
    }

    fileprivate func createFrontViews() -> some View {
        let numberOfRows: Int = 2
        let numberOfColumns: Int = 7

        return VStack(alignment: .center, spacing: 10) {
            ForEach(0..<numberOfRows, id: \.self) { rowItem in
                HStack(alignment: .center, spacing: 10) {
                    ForEach(0..<numberOfColumns, id: \.self) { columnItem in
                        ChairView(seat: Seat(id: UUID(), row: rowItem + 1, number: columnItem + 1),
                                  width: 30,
                                  isSelectable: true,
                                  isSelected: false,
                                  onSelect: { (seat) in
                                    self.selectedSeats.append(seat)
                        }) { (seat) in
                            self.selectedSeats.removeAll(where: { return seat.id == $0.id })
                        }
                    }
                }
            }
        }
    }

    fileprivate func createBackViews() -> some View {
        let numberOfRows: Int = 5
        let numberOfColumns: Int = 9

        return VStack(alignment: .center, spacing: 10) {
            ForEach(0..<numberOfRows, id: \.self) { rowItem in
                HStack(alignment: .center, spacing: 10) {
                    ForEach(0..<numberOfColumns, id: \.self) { columnItem in
                        ChairView(seat: Seat(id: UUID(), row: rowItem + 3, number: columnItem + 1),
                                  width: 30,
                                  isSelectable: true,
                                  isSelected: false,
                                  onSelect: { (seat) in
                                    self.selectedSeats.append(seat)
                        }) { (seat) in
                            self.selectedSeats.removeAll(where: { return seat.id == $0.id })
                        }
                    }
                }
            }
        }
    }

    fileprivate func createSeatLegends() -> some View {
        HStack(alignment: .center, spacing: 0) {
            ChairLegend(legendText: "Selected", accentColor: .blue)
            Spacer()
            ChairLegend(legendText: "Reserved", accentColor: .clearPurple)
            Spacer()
            ChairLegend(legendText: "Available", accentColor: .gray)
        }
        .padding(.horizontal, 20)
        .padding(.top)
    }
}

struct TheatreView_Previews: PreviewProvider {
    static var previews: some View {
        TheatreView(selectedSeats: .constant([]))
    }
}

//
//  ChairView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/25.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct ChairView: View {
    var seat: Seat

    var width: CGFloat = 50

    var isSelectable: Bool = true

    @State var isSelected: Bool = false

    var accentColor: Color = .blue

    var onSelect: ((Seat)->()) = {_ in }
    var onDeselect: ((Seat)->()) = {_ in }

    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            Rectangle()
                .frame(width: self.width, height: self.width * 2/3, alignment: .center)
                .foregroundColor(isSelectable ? (isSelected ? accentColor : Color.gray.opacity(0.5)) : accentColor)
                .cornerRadius(self.width/5)

            Rectangle()
                .frame(width: self.width-10, height: self.width/5, alignment: .center)
                .foregroundColor(isSelectable ? (isSelected ? accentColor : Color.gray.opacity(0.5)) : accentColor)
                .cornerRadius(self.width/5)

        }.onTapGesture {
            if self.isSelectable {
                self.isSelected.toggle()

                if self.isSelected {
                    self.onSelect(self.seat)
                } else {
                    self.onDeselect(self.seat)
                }
            }
        }
    }
}

struct ChairView_Previews: PreviewProvider {
    static var previews: some View {
        ChairView(seat: Seat.default)
    }
}

//
//  BottomTicketView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/26.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct BottomTicketView: View {
    var body: some View {
        Image("Barcode")
            .resizable()
            .scaledToFit()
            .padding(30)
            .frame(minWidth: 0.0, maxWidth: .infinity)
            .foregroundColor(Color.gray)
    }
}

struct BottomTicketView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTicketView()
    }
}

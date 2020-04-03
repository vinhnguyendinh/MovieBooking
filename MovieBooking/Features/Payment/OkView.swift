//
//  OkView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/26.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct OkView: View {
    var width: CGFloat = 30
    var lineWidth: CGFloat = 7

    var body: some View {
        OkShape()
            .stroke(style: StrokeStyle(lineWidth: self.lineWidth, lineCap: .round, lineJoin: .round))
            .fill(LinearGradient(gradient: Gradient(colors: [Color.accent, .darkPurple]) , startPoint: .leading, endPoint: .trailing))
            .frame(width: self.width, height: self.width * 2)
            .rotationEffect(Angle(degrees: 45) )

    }
}

struct OkView_Previews: PreviewProvider {
    static var previews: some View {
        OkView()
    }
}

struct OkShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            path.move(to: CGPoint(x: rect.origin.x, y: rect.size.height))
            path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
            path.addLine(to: CGPoint(x: rect.size.width, y: rect.origin.y))
        }
    }
}

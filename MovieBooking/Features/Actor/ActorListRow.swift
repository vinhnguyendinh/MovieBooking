//
//  ActorListRow.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/08/01.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct ActorListRow: View {
    var actor: Actor

    var body: some View {
        ZStack(alignment: .init(horizontal: .center, vertical: .bottom)) {
            createActorImageView()
            createDetailView()
        }.padding([.top, .bottom], 5)
    }

    fileprivate func createActorImageView() -> some View {
        return Image(uiImage: UIImage(named: "\(actor.image).jpg") ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
    }

    fileprivate func createDetailView() -> some View {
        VStack(alignment: .leading) {
            Text("\(actor.name)")
                .foregroundColor(.white)
                .font(.system(size: 25, weight: .black, design: .rounded))
                .lineLimit(nil)

            Text("\(actor.bio)")
                .foregroundColor(.white)
                .font(.body)
                .lineLimit(3)
        }.padding()
    }
}

struct ActorListRow_Previews: PreviewProvider {
    static var previews: some View {
        ActorListRow(actor: Actor.default)
    }
}

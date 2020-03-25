//
//  ActorDetailView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/24.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct ActorDetailView: View {
    var actor: Actor

    var body: some View {
        ScrollView {
            VStack {
                createActorImage()
                createDetailActorView()
            }
        }.edgesIgnoringSafeArea(.top)
    }

    fileprivate func createActorImage() -> some View {
        return Image(uiImage: UIImage(named: "\(actor.image).jpg") ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
    }

    fileprivate func createDetailActorView() -> some View {
        return VStack(alignment: .leading, spacing: 0) {
            Text(actor.name)
                .font(.system(size: 35, weight: .black, design: .rounded))
                .layoutPriority(1)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)

            Text(actor.bio)
                .font(.body)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }.padding()
    }
}

struct ActorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActorDetailView(actor: Actor.default)
    }
}

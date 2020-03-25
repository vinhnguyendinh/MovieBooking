//
//  ActorListView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/08/01.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct ActorListView: View {
    var actorList: [Actor]

    var section: HomeSection

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                List(actorList) { actor in
                    ActorListRow(actor: actor)
                }
            }
            .navigationBarTitle(section.rawValue)
        }
    }
}

struct ActorListView_Previews: PreviewProvider {
    static var previews: some View {
        ActorListView(actorList: [Actor.default], section: .Actors)
    }
}

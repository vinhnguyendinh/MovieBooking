//
//  MovieListView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/24.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct MovieListView<T: Movie>: View {
    var movieList: [T]

    var section: HomeSection

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                List(movieList) { movie in
                    MovieListRow(movie: movie)
                }
            }
            .navigationBarTitle(section.rawValue)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movieList: [Trending.default], section: .Trending)
    }
}

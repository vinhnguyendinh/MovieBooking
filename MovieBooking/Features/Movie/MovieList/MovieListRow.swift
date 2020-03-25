//
//  MovieListRow.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/24.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct MovieListRow<T: Movie>: View {
    var movie: T

    var body: some View {
        ZStack(alignment: .init(horizontal: .center, vertical: .bottom)) {
            Image(uiImage: UIImage(named: "\(movie.image).jpg") ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)

            VStack(alignment: .leading) {
                Text("\(movie.title)")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .black, design: .rounded))
                    .lineLimit(nil)
                LineRatingView(value: movie.rating)
            }.padding()
        }.padding([.top, .bottom], 5)
    }
}

struct MovieListRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieListRow(movie: Trending.default)
    }
}

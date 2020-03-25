//
//  MovieDetailView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/23.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct MovieDetailView<T: Movie>: View {
    var movie: T

    @State private var showSeats: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            createTitle()
            LineRatingView(value: movie.rating)
            createGenreList()

            HStack {
                Text(self.movie.releaseDate).foregroundColor(Color.gray)
                Spacer()
                Text(self.movie.runtime).foregroundColor(Color.gray)
            }.padding(.vertical)

            createDescription()
            createChooseSeatButton()

        }
        .padding(.horizontal)
        .padding(.bottom, 20)
        .sheet(isPresented: $showSeats) {
            SeatsChoiceView(movie: self.movie)
        }
    }

    fileprivate func createTitle() -> some View {
        return Text(self.movie.title)
            .font(.system(size: 35, weight: .black, design: .rounded))
            .layoutPriority(1)
            .multilineTextAlignment(.leading)
            .lineLimit(nil)
    }

    fileprivate func createGenreList() -> some View {
        return ScrollView(.horizontal) {
            HStack{
                ForEach(self.movie.genres, id: \.self) { genre in
                    Text(genre)
                        .bold()
                        .padding(5)
                        .background(Color.lightGray)
                        .cornerRadius(10)
                        .foregroundColor(Color.gray)
                }
            }
        }
    }

    fileprivate func createDescription() -> some View {
        return Text(self.movie.description)
            .lineLimit(nil)
            .font(.body)
    }

    fileprivate func createChooseSeatButton() -> some View {
        return LCButton(text: "Choose seats") {
            self.showSeats.toggle()
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Popular.default)
    }
}

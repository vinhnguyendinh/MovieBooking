//
//  ContentView.swift
//  MovieBooking
//
//  Created by Vinh Nguyen Dinh on 2020/03/23.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var model = MovieViewModel()

    @State private var showDetails = false
    @State private var selectedIndex: Int?
    @State private var section: HomeSection = .Popular
    @State private var showSheet = false

    var body: some View {
        var popular: [Popular] = []
        var trending: [Trending] = []
        var actors: [Actor]  = []
        var upcoming: [Upcoming] = []

        switch section {
        case .Popular:
            popular = model.allItems[section] as! [Popular]
        case .Actors:
            actors = model.allItems[section] as! [Actor]
        case .Trending:
            trending = model.allItems[section] as! [Trending]
        case .Upcoming:
            upcoming = model.allItems[section] as! [Upcoming]
        }

        let movieCollectionView = createCollectionView()
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("Movies")
            .sheet(isPresented: self.$showSheet) {
                if self.selectedIndex == nil {
                    // Movie list show all
                    if self.section == HomeSection.Trending {
                        MovieListView(movieList: trending, section: .Trending)
                    }
                    if self.section == HomeSection.Popular {
                        MovieListView(movieList: popular, section: .Popular)
                    }
                    if self.section == HomeSection.Upcoming {
                        MovieListView(movieList: upcoming, section: .Upcoming)
                    }
                    if self.section == HomeSection.Actors {
                        ActorListView(actorList: actors, section: .Actors)
                    }
                } else {
                    // Movie detail
                    if self.section == HomeSection.Trending {
                        SingleMovieView(movie: trending[self.selectedIndex!])
                    }
                    if self.section == HomeSection.Popular {
                        SingleMovieView(movie: popular[self.selectedIndex!])

                    }
                    if self.section == HomeSection.Upcoming {
                        SingleMovieView(movie: upcoming[self.selectedIndex!])
                    }
                    if self.section == HomeSection.Actors {
                        ActorDetailView(actor: actors[self.selectedIndex!])
                    }
                }
        }

        return NavigationView {
            movieCollectionView
        }

    }

    fileprivate func createCollectionView() -> MovieCollectionView {
        return MovieCollectionView(allItems: model.allItems,
                                   didSelectItem: { indexPath in
                                    self.selectedIndex = indexPath.item
                                    self.section = HomeSection.allCases[indexPath.section]
                                    self.showSheet.toggle()
        },
                                   seeAllforSection: { section in
                                    self.section = section
                                    self.selectedIndex = nil
                                    self.showSheet.toggle()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

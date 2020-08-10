//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Cathal Farrell on 06/08/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import SwiftUI

/*
    Challenge 1 - Add a photo credit over the ResortView image.
    The data is already loaded from the JSON for this purpose,
    so you just need to make it look good in the UI.
*/

struct ImageOverlay: View {

    var accrediation: String

    var body: some View {
        ZStack {
            Text("Credit: \(accrediation)")
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }
        .background(Color.black)
        .opacity(0.6)
        //.cornerRadius(10.0)
        .padding(6)
    }
}

struct ResortView: View {

    @Environment(\.horizontalSizeClass) var sizeClass
    @EnvironmentObject var favourites: Favourites

    @State private var selectedFacility: Facility?
    
    let resort: Resort

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0){
                Image(decorative: resort.id)
                .resizable()
                .scaledToFit()
                .overlay(ImageOverlay(accrediation: resort.imageCredit), alignment: .bottomLeading)

                Group {
                    HStack {
                        if sizeClass == .compact {
                            Spacer()
                            VStack(alignment: .leading) { ResortDetailsView(resort: resort) }
                            VStack(alignment: .leading) { SkiDetailsView(resort: resort) }
                            Spacer()
                        } else {
                            ResortDetailsView(resort: resort)
                            Spacer().frame(height: 0)
                            SkiDetailsView(resort: resort)
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top)
                    Text(resort.description)
                        .padding(.vertical)
                    Text("Facilities")
                        .font(.headline)
                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            facility.icon
                                .font(.title)
                                .onTapGesture {
                                    self.selectedFacility = facility //<-triggers state change
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)

                Button(favourites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
                    if self.favourites.contains(self.resort) {
                        self.favourites.remove(self.resort)
                    } else {
                        self.favourites.add(self.resort)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle(Text("\(resort.name), \(resort.country))"), displayMode: .inline)
        .alert(item: $selectedFacility) { facility in
            facility.alert
        }
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: Resort.example)
        //ResortView(resort: Resort.allResorts[5])
    }
}

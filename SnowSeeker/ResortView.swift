//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Cathal Farrell on 06/08/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import SwiftUI

struct ResortView: View {

    @Environment(\.horizontalSizeClass) var sizeClass

    @State private var selectedFacility: String?
    
    let resort: Resort

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0){
                Image(decorative: resort.id)
                .resizable()
                .scaledToFit()

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
                        ForEach(resort.facilities) { facility in
                            Facility.icon(for: facility)
                                .font(.title)
                                .onTapGesture {
                                    self.selectedFacility = facility //<-triggers state change
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(Text("\(resort.name), \(resort.country))"), displayMode: .inline)
        .alert(item: $selectedFacility) { facility in
            Facility.alert(for: facility)
        }
    }
}

extension String: Identifiable {
    public var id: String { self }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        //ResortView(resort: Resort.example)
        ResortView(resort: Resort.allResorts[5])
    }
}

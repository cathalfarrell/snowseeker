//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Cathal Farrell on 06/08/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    let resorts: [Resort] = Bundle.main.decode("resorts.json")

    var body: some View {
        NavigationView {

            //List Menu - portrait view on most devices
            List(resorts) { resort in
                NavigationLink(destination: ResortView(resort: resort)) {
                    Image(resort.country)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 25)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 5)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1)
                    )

                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                }
                .navigationBarTitle("Resorts")
            }

            //Detail Screen - default on large devices in landscape
            WelcomeView()
        }
        //.phoneOnlyStackNavigationView()
    }
}

// This extension turns off the default Apple Master-Detail layouts if you dont want them
// just use .phoneOnlyStackNavigationView() modifier above

extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Cathal Farrell on 06/08/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import SwiftUI

struct SkiDetailsView: View {

    let resort: Resort

    var body: some View {
        VStack {
            Text("Elevation: \(resort.elevation)")
            Text("Snow: \(resort.snowDepth)cm")
        }
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resort: Resort.example)
    }
}

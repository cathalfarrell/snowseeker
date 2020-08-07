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

    //NB: layout priority here means that the text gets priority over the spacer and so avoids horiztonal compression
    
    var body: some View {
        Group {
            Text("Elevation: \(resort.elevation)").layoutPriority(1)
            Spacer().frame(height: 0)
            Text("Snow: \(resort.snowDepth)cm").layoutPriority(1)
        }
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resort: Resort.example)
    }
}

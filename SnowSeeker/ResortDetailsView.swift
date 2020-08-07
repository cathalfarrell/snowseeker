//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Cathal Farrell on 06/08/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import SwiftUI

struct ResortDetailsView: View {

    let resort: Resort

    var size: String {
        switch resort.size {
        case 1:
            return "Small"
        case 2:
            return "Medium"
        default:
            return "Large"
        }
    }

    var price: String {
        //To produce $, $$, or $$$ from price ratings 1, 2, 3
        String(repeating: "$", count: resort.price)
    }

    var body: some View {
        VStack {
            Text("Size: \(size)")
            Text("Price: \(price)")
        }
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ResortDetailsView(resort: Resort.example)
    }
}

//
//  Favourites.swift
//  SnowSeeker
//
//  Created by Cathal Farrell on 07/08/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import SwiftUI

class Favourites: ObservableObject {
    private var resorts: Set<String>

    private let saveKey = "Favourites"

    init() {
        //load our saved data
        self.resorts = []
        loadData()
    }

    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }

    // removes the resort from our set, updates all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }

    func save() {
        // write out our data

        print("Saving data...")

        do {
            let data = try JSONEncoder().encode(resorts)
            UserDefaults.standard.set(data, forKey: saveKey)
            print("Saved your \(self.resorts.count) favourite resorts.")
        } catch (let error) {
            print("Error on saving: \(error.localizedDescription)")
        }
    }

    func loadData() {
        // load our data

        print("Loading data...")

        do {
            if let data = UserDefaults.standard.data(forKey: saveKey) {
                let decoded = try JSONDecoder().decode(Set<String>.self, from: data)
                self.resorts = decoded
                print("Loaded your \(self.resorts.count) favourite resorts.")
            }
        } catch (let error) {
            print("Error on saving: \(error.localizedDescription)")
        }
    }


}

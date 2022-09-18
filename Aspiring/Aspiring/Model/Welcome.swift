//
//  Welcome.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-17.
//

import SwiftUI

class Welcome: Identifiable {
    let id = UUID()
    var title: String
    var stars: Int
    var goal: Int = 200

    init(
        title: String,
        stars: Int
    ) {
        self.title = title
        self.stars = stars
    }

    var remaining: Int {
        goal - stars
    }

    var subtitle: String {
        "Ще \(remaining) ⭐️ до твого нового меча"
    }

}

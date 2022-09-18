//
//  Advertisement.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-17.
//

import SwiftUI

struct Advertisement: Identifiable {
    let id = UUID()
    var title: String
    var type: AdvertisementType
    var subtitle: String
    var image: String
}

enum AdvertisementType: String, CaseIterable, Hashable, Identifiable {

    case work = "Потребує вашого часу"
    case donation = "Збір коштів"
    case itemDonation = "Збір речей"

    var emoji: String {
        switch self {
        case .work:
            return "🙋‍♂️🙋‍♀️"
        case .donation:
            return "💸"
        case .itemDonation:
            return "👖"
        }
    }

    var id: String {
        switch self {
        case .work:
            return "0"
        case .donation:
            return "1"
        case .itemDonation:
            return "2"
        }
    }

    var equialent: EquialentType {
        switch self {
        case .work:
            return .person
        case .donation:
            return .money
        case .itemDonation:
            return .items
        }
    }
}

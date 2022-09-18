//
//  Advertisement.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-17.
//

import SwiftUI

class Advertisement: Identifiable {
    let id = UUID()
    var title: String
    var type: AdvertisementType
    var subtitle: String
    var limit: Int
    var alreadyDone: Int
    var details: String

    init(
        title: String,
        type: AdvertisementType,
        subtitle: String,
        limit: Int,
        alreadyDone: Int,
        details: String
    ) {
        self.title = title
        self.type = type
        self.subtitle = subtitle
        self.limit = limit
        self.alreadyDone = alreadyDone
        self.details = details
    }
}

enum AdvertisementType: String, CaseIterable, Hashable, Identifiable {

    case work = "Потребує вашого часу"
    case donation = "Збір коштів"
    case itemDonation = "Збір речей"
    case create = ""
}

extension Advertisement {

    var progress: CGFloat {
        CGFloat(alreadyDone) / CGFloat(limit)
    }

    func updateWith(_ value: Int) {
        alreadyDone += value
    }

}

extension AdvertisementType {

    var starsCost: Int {
        switch self {
        case .work:
            return 100
        case .donation:
            return 30
        case .itemDonation:
            return 30
        case .create:
            return 0
        }
    }

    var imageName: String {
        switch self {
        case .work:
            return "clock"
        case .donation:
            return "dollarsign"
        case .itemDonation:
            return "shippingbox"
        case .create:
            return "plus"
        }
    }

    var emoji: String {
        switch self {
        case .work:
            return "🙋‍♂️🙋‍♀️"
        case .donation:
            return "💸"
        case .itemDonation:
            return "👖"
        case .create:
            return "➕"
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
        case .create:
            return "3"
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
        case .create:
            return .items
        }
    }
    
}

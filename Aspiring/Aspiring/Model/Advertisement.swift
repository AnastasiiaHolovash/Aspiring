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
    var limit: Int
    var alreadyDone: Int
    var details: String
}

enum AdvertisementType: String {
    case work = "Потребує вашого часу"
    case donation = "Збір коштів"
    case itemDonation = "Збір речей"
    case create = ""
}

extension Advertisement {

    var progress: CGFloat {
        CGFloat(alreadyDone) / CGFloat(limit)
    }

}

extension AdvertisementType {

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
    
}

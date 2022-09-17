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
}

enum AdvertisementType: String {
    case work = "Потребує вашого часу"
    case donation = "Збір коштів"
    case itemDonation = "Збір речей"
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
        }
    }

    var imageColor: Color {
        switch self {
        case .work:
            return Color("Work")
        case .donation:
            return Color("Donation")
        case .itemDonation:
            return Color("ItemDonation")
        }
    }
}

//
//  Task.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 17.09.2022.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var type: AdvertisementType
    var description: String
    var emoji: Emoji?

    var city: String?
    var street: String?
    var houseNumber: String?

    var goal: Int
    var equivalentType: EquialentType
}

enum EquialentType: String {
    case money = "грн"
    case person = "волонтерів"
    case items = "штук"

    var placeholder: String {
        switch self {
        case .money:
            return "0.0 грн."
        case .person,
                .items:
            return self.rawValue.capitalized
        }
    }

    var emoji: String {
        switch self {
        case .money:
            return "💸"
        case .person:
            return "🙋🏼"
        case .items:
            return "👖"
        }
    }
}

enum Emoji: String {
    case cat = "🐈"
    case dog = "🐶"
    case bird = "🕊"
    case citySunset = "🌇"
    case money = "💵"
    case gun = "🔫"
    case power = "💪"
}

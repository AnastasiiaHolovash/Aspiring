//
//  Tab.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-17.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "Головна", icon: "house", tab: .home, color: .teal),
    TabItem(text: "Мої огошення", icon: "doc.fill", tab: .myAdvertisement, color: .teal),
    TabItem(text: "Профіль", icon: "person.fill", tab: .profile, color: .teal)
]

enum Tab: String {
    case home
    case myAdvertisement
    case profile
}

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

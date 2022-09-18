//
//  Achievment.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 18.09.2022.
//

import Foundation

struct Achievment: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let emoji: String
    let isReady: Bool
}

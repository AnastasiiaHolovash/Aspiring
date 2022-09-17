//
//  Auth.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 17.09.2022.
//

import SwiftUI
import Combine

class Auth: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var selectedModal: AuthStep = .enterCode
}

enum AuthStep: String {
    case enterPhone
    case enterCode
}


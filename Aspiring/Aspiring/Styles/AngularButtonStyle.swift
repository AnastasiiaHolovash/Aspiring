//
//  AngularButtonStyle.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 17.09.2022.
//

import SwiftUI

struct AngularButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 14)
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(.linearGradient(
                        colors: [
                            Color(.systemBackground),
                            Color(.systemBackground).opacity(0.6)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .blendMode(.softLight)
            )
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(.angularGradient(
                        colors: [
                            .pink,
                            .purple,
                            .blue,
                            .pink
                        ],
                        center: .center,
                        startAngle: .degrees(-90),
                        endAngle: .degrees(270)
                    ))
                    .blur(radius: 16)
            )
            .strokeStyle(cornerRadius: 16)
    }
}

extension ButtonStyle where Self == AngularButtonStyle {
    static var angular: Self {
        return .init()
    }
}

//
//  AngularButtonStyle.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 17.09.2022.
//

import SwiftUI

struct AngularBlueButtonStyle: ButtonStyle {
    @Environment(\.controlSize) var controlSize

    var extraPadding: CGFloat {
        switch controlSize {
        case .mini:
            return 0
        case .small:
            return 0
        case .regular:
            return 4
        case .large:
            return 12
        @unknown default:
            return 0
        }
    }

    var cornerRadius: CGFloat {
        switch controlSize {
        case .mini:
            return 12
        case .small:
            return 12
        case .regular:
            return 16
        case .large:
            return 20
        @unknown default:
            return 12
        }
    }

    let isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 10 + extraPadding)
            .padding(.vertical, 4 + extraPadding)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(.linearGradient(colors: [Color(.systemBackground), Color(.systemBackground).opacity(0.6)], startPoint: .top, endPoint: .bottom))
                    .blendMode(.softLight)
            )
            .if(isEnabled, transform: { view in
                view
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(.angularGradient(colors: [.teal, .purple, .blue, .teal], center: .center, startAngle: .degrees(-90), endAngle: .degrees(270)))
                        .blur(radius: cornerRadius)
                )
            })
            .if(!isEnabled, transform: { view in
                view
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(.angularGradient(colors: [.gray, .secondary, .gray], center: .center, startAngle: .degrees(-90), endAngle: .degrees(270)))
                        .blur(radius: cornerRadius)
                )
            })
            .strokeStyle(cornerRadius: cornerRadius)
    }
}

struct AngularButtonStyle: ButtonStyle {
    @Environment(\.controlSize) var controlSize

    var extraPadding: CGFloat {
        switch controlSize {
        case .mini:
            return 0
        case .small:
            return 0
        case .regular:
            return 4
        case .large:
            return 12
        @unknown default:
            return 0
        }
    }

    var cornerRadius: CGFloat {
        switch controlSize {
        case .mini:
            return 12
        case .small:
            return 12
        case .regular:
            return 16
        case .large:
            return 20
        @unknown default:
            return 12
        }
    }

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

extension ButtonStyle where Self == AngularBlueButtonStyle {
    
    static var angularBlue: Self {
        return .init(isEnabled: true)
    }

    static var enabledAngular: Self {
        return .angularBlue
    }

    static var disabledAngular: Self {
        return .init(isEnabled: false)
    }

    static var enabledAngularBlue: Self {
        return .angularBlue
    }

    static var disabledAngularBlue: Self {
        return .init(isEnabled: false)
    }
}

extension ButtonStyle where Self == AngularButtonStyle {

    static var angular: Self {
        return .init()
    }

}


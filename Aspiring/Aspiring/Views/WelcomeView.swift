//
//  WelcomeView.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-17.
//

import SwiftUI

struct WelcomeView: View {
    var welcomeData: Welcome = welcome
    @Environment(\.sizeCategory) var sizeCategory

    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            VStack {
                Image(systemName: "star.fill")
                    .resizable(resizingMode: .stretch)
                    .frame(width: 90, height: 90)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color("StarLight").opacity(0.7), Color("StarDark")],
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing
                        )
                    )
                    .strokeStyle(cornerRadius: 16)
                Text(String(welcomeData.stars))
                    .font(.title)
            }
            Spacer()
            Text(welcomeData.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .lineLimit(1)
                .dynamicTypeSize(.large)
            Text(welcomeData.subtitle.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20)
        .frame(height: 350.0)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//        .cornerRadius(30.0)
//        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle()
        .padding(.horizontal, 20)
    }
}

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environment(\.sizeCategory, .extraExtraLarge)
    }
}

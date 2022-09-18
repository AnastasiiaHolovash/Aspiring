//
//  WelcomeView.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-17.
//

import SwiftUI

struct WelcomeView: View {
    var welcomeData: Welcome
    @EnvironmentObject var model: Model

    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            HStack {
                Spacer()

                VStack {
                    Image("star")
                        .frame(width: 100, height: 100)
                    Text(String(welcomeData.stars))
                        .font(.title)
                }

                Spacer()

                Text(verbatim: "🐈‍⬛")
                    .font(.system(size: 150, weight: .regular))

                Spacer()
            }

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

            Spacer()
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20)
        .frame(height: 280)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle()
        .padding(.horizontal, 20)
    }
}

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(welcomeData: welcome)
            .environment(\.sizeCategory, .extraExtraLarge)
    }
}

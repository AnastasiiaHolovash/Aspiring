//
//  AdvertisementView.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-18.
//

import SwiftUI

struct AdvertisementView: View {
    var advertisement: Advertisement = createAdvertisement

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(advertisement.type.imageName)
                .frame(width: 36, height: 36)
                .mask(Circle())
                .padding(12)
                .background(Color(UIColor.systemBackground).opacity(0.3))
                .mask(Circle())
                .overlay(ProgressView(value: advertisement.progress))

            VStack(alignment: .leading, spacing: 8) {
                Text(advertisement.type.rawValue.uppercased())
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.secondary)

                Text(advertisement.title)
                    .fontWeight(.semibold)

                Text(advertisement.subtitle)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(20)
    }
}

struct AdvertisementView_Previews: PreviewProvider {
    static var previews: some View {
        AdvertisementView()
    }
}

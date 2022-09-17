//
//  Advertisement.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-17.
//

import SwiftUI

struct SectionRow: View {
    
    var advertisement: Advertisement = advertisements[0]

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: advertisement.type.imageName)
                .resizable()
                .frame(width: 36, height: 36)
                .mask(Circle())
                .padding(12)
                .background(Color(UIColor.systemBackground).opacity(0.3))
                .mask(Circle())
                .overlay(ProgressView(value: advertisement.progress))

            VStack(alignment: .leading, spacing: 8) {
                Text(advertisement.subtitle)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.secondary)
                Text(advertisement.title)
                    .fontWeight(.semibold)
                Text(advertisement.type.rawValue)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.secondary)
                ProgressView(value: advertisement.progress)
                    .accentColor(.white)
                    .frame(maxWidth: 132)
            }
        }
        .padding(20)
    }
}

struct SectionRow_Previews: PreviewProvider {
    static var previews: some View {
        SectionRow()
    }
}

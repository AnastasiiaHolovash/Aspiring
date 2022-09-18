//
//  CategoryItemView.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 18.09.2022.
//

import SwiftUI

struct CategoryItemView: View {

    var category: AdvertisementType = AdvertisementType.allCases[1]
    var isSelected: Bool = false
    @Environment(\.sizeCategory) var sizeCategory

    var body: some View {

        VStack(alignment: .leading, spacing: 8.0) {
            HStack {
                Spacer()
                Text(category.emoji)
                    .font(.largeTitle.bold())
                Spacer()
            }
            HStack {
                Spacer()
                Text(category.rawValue)
                    .font(.body)
                    .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .lineLimit(1)
                    .dynamicTypeSize(.large)
                Spacer()
            }
        }
        .frame(width: 120.0, height: 120.0)
        .background(.ultraThinMaterial)
        .if(isSelected, transform: { view in
                view.background(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(.linearGradient(colors: [.teal, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .rotation3DEffect(.degrees(10), axis: (x: 0, y: 1, z: 0), anchor: .bottomTrailing)
                        .rotationEffect(.degrees(180))
                        .padding(.trailing, 40)
                )
        })

        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle()
    }


}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView()
            .environment(\.sizeCategory, .extraExtraLarge)
    }
}

//
//  CatAdditionalsView.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 18.09.2022.
//

import SwiftUI

struct CatAdditionalsView: View {

    @State var title: String = ""
    @State var additions: [CatAddition] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            VStack {
                HStack {
                    Text(title)
                        .font(.title.weight(.medium))
                        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .lineLimit(1)
                        .dynamicTypeSize(.large)
                    Spacer()
                }
                HStack {
                    Text("У тебе є 200 ⭐️")
                        .font(.body.weight(.medium))
                        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .lineLimit(1)
                        .dynamicTypeSize(.large)
                    Spacer()
                }
            }
            HStack {
                Spacer()
                ForEach(additions) { addition in
                    VStack {
                        Text(addition.emoji)
                            .font(.system(size: 64))
                        Text(addition.price)
                    }
                    Spacer()
                }
            }
            Spacer()
        }
        .padding(.horizontal)
        .frame(width: .infinity, height: 174)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle()
    }

}

struct CatAdditionalsView_Previews: PreviewProvider {
    static var previews: some View {
        CatAdditionalsView(title: "Скіни", additions: catScins)
    }
}

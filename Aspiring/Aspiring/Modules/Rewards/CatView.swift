//
//  CatView.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 18.09.2022.
//

import SwiftUI

struct CatView: View {
    @AppStorage("isLiteMode") var isLiteMode = true

    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            HStack {
                Spacer()
                Text("🐈‍⬛")
                    .font(.system(size: 150))
                Spacer()
            }
            VStack {
                HStack {
                    Text("Кіт 20 лвл")
                        .font(.title.weight(.medium))
                        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .lineLimit(1)
                        .dynamicTypeSize(.large)
                    Spacer()
                }
                .padding(.bottom, 4)
                HStack {
                    Text("20/100 􀋃 ")
                        .font(.body.weight(.regular))
                        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .lineLimit(1)
                        .dynamicTypeSize(.large)
                    Text("до наступного лвл")
                        .font(.body.weight(.medium))
                        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .lineLimit(1)
                        .dynamicTypeSize(.large)
                    Spacer()
                }
            }
            .padding(.leading)
            .padding(.bottom)
        }
        .frame(width: .infinity, height: 272.0)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle()
    }
}


struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
    }
}

//
//  AchievmentView.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 18.09.2022.
//

import SwiftUI

struct AchievmentView: View {

    @State var achievment: Achievment = userAchievments[0]

    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            HStack {
                Spacer()
                Text(achievment.emoji)
                    .font(.system(size: 90))
                    .lineLimit(0)
                Spacer()
            }
            VStack {
                HStack {
                    Spacer()
                    Text(achievment.title)
                        .font(.title.weight(.bold))
                        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .lineLimit(1)
                        .dynamicTypeSize(.large)
                    Spacer()
                }
                .padding(.bottom, 4)
                HStack {
                    Spacer()
                    Text(achievment.description)
                        .font(.body.weight(.regular))
                        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .lineLimit(1)
                        .dynamicTypeSize(.large)
                    Spacer()
                }
            }
//            .padding(.leading)
            .padding(.bottom)
        }
        .background(.ultraThinMaterial)
        .if(achievment.isReady, transform: { view in
                view.background(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(.linearGradient(colors: [.teal, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .rotation3DEffect(.degrees(10), axis: (x: 0, y: 1, z: 0), anchor: .bottomTrailing)
                        .rotationEffect(.degrees(180))
                        .padding(.trailing, 40)
                )
        })
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle()
    }

}

struct AchievmentView_Previews: PreviewProvider {
    static var previews: some View {
        AchievmentView(achievment: userAchievments[0])
    }
}

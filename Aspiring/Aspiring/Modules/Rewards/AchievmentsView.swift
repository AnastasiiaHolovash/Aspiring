//
//  AchievmentsView.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 18.09.2022.
//

import SwiftUI

struct AchievmentsView: View {

    @State var achievments: [Achievment] = []

    let columns = [
        GridItem(.adaptive(minimum: 187))
    ]

    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(achievments) { item in
                        AchievmentView(achievment: item)
                    }
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }

}

struct AchievmentsVieww_Previews: PreviewProvider {
    static var previews: some View {
        AchievmentsView(achievments: userAchievments)
    }
}

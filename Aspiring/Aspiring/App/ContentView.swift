//
//  ContentView.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-17.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @EnvironmentObject var model: Model

    var body: some View {
        ZStack(alignment: .bottom) {

            switch selectedTab {
            case .home:
                HomeView()
            case .create:
                Rectangle()
            case .myAdvertisement:
                Rectangle()
            }

            TabBar()
                .offset(y: model.showDetail ? 200 : 0)

        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Color.clear.frame(height: 88)
        }
        .dynamicTypeSize(.large ... .xxLarge)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

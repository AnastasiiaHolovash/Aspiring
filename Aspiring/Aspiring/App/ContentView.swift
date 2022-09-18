//
//  ContentView.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-17.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("isShowingScanner") var isShowingScanner = false
    @EnvironmentObject var model: Model

    var body: some View {
        ZStack(alignment: .bottom) {

            switch selectedTab {
            case .home:
                HomeView()

            case .myAdvertisement:
                MyAdvertisements()

            case .profile:
                ModalView()
            }

            TabBar()
                .offset(y: model.showDetail ? 200 : 0)
        }
        .sheet(isPresented: $isShowingScanner) {
            ZStack {
                CodeScannerView(codeTypes: [.qr]) { result in
                    isShowingScanner = false

                    switch result {
                    case let .success(result):
                        print(result)

                    case let .failure(error):
                        print("Scanning failed: \(error.localizedDescription)")
                    }
                }

                Image("qrFrame")
            }
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

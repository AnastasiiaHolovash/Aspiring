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
    @State var isShowingResult: Bool = false
    @State var resultStars: String = ""

    var body: some View {
        ZStack(alignment: .bottom) {

//            switch selectedTab {
//            case .home:
//                HomeView()
//                    .environmentObject(model)
//
//            case .myAdvertisement:
//                MyAdvertisements()
//                    .environmentObject(model)
//
//            case .profile:
//                ModalView()
//                    .environmentObject(model)
//            }
//
//            TabBar()
//                .offset(y: model.showDetail ? 200 : 0)
            RewardsView()
        }
        .sheet(isPresented: $isShowingScanner) {
            codeScannerView
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Color.clear.frame(height: 88)
        }
    }

    var codeScannerView: some View {
        ZStack {
            CodeScannerView(codeTypes: [.qr]) { result in
                switch result {
                case let .success(result):
                    isShowingResult = true
                    resultStars = result.string.components(separatedBy: "\n").last ?? ""
                    model.welcome.stars += Int(resultStars) ?? 50
//                    model.welcome.stars += 50

                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                        isShowingScanner = false
                    }

                case let .failure(error):
                    print("Scanning failed: \(error.localizedDescription)")
                }
            }

            switch isShowingResult {
            case false:
                Image("qrFrame")

            case true:
                VStack(alignment: .center) {
                    Spacer()

                    Image("star")
                        .frame(width: 100, height: 100)

                    Text("+ \(resultStars)")
                        .font(.system(size: 40, weight: .bold))
                        .padding(.horizontal, 20)

                    Spacer()
                }
                .frame(width: 200, height: 200, alignment: .center)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle(cornerRadius: 30)
                .padding(20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

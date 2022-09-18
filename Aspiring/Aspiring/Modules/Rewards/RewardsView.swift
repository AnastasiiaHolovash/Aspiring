//
//  RewardsView.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 18.09.2022.
//

import SwiftUI
import Introspect

struct RewardsView: View {

    @EnvironmentObject var model: Model
    @State private var selectedSegmentTag = 0
    @Binding var presentedAsModal: Bool
    @State var appear = [false, false, false]
    @State var showStatusBar = true
    @State var show = false

    // MARK: - Body

    var body: some View {
        VStack {
            top
            segments
        }
        .onAppear {
            withAnimation(.spring().delay(0.1)) {
                appear[0] = true
            }
            withAnimation(.spring().delay(0.2)) {
                appear[1] = true
            }
            withAnimation(.spring().delay(0.3)) {
                appear[2] = true
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(
            Image("BlueSpot")
                .opacity(appear[2] ? 1 : 0)
                .offset(y: appear[2] ? 0 : 10)
                .blur(radius: appear[2] ? 0 : 40)
                .allowsHitTesting(false)
                .accessibility(hidden: true)
        )
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }
        }
    }

    var segments: some View {
        Picker("", selection: $selectedSegmentTag) {
            Text("Котики")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title.weight(.bold))
                .padding(.leading, 20)
                .foregroundStyle(.linearGradient(colors: [.accentColor, .accentColor.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .tag(0)
            
            Text("Досягнення")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title.weight(.bold))
                .padding(.leading, 20)
                .foregroundStyle(.linearGradient(colors: [.accentColor, .accentColor.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .tag(1)
        }
        .introspectSegmentedControl { segmentedControl in
                segmentedControl.backgroundColor = .clear
                segmentedControl.tintColor = UIColor(Color.accentColor)
            segmentedControl.selectedSegmentTintColor = UIColor(Color.accentColor).withAlphaComponent(0.7)
                segmentedControl.setTitleTextAttributes([
                    NSAttributedString.Key.foregroundColor: UIColor(.white)
                ], for: .selected)
                segmentedControl.setTitleTextAttributes([
                    NSAttributedString.Key.foregroundColor: UIColor(Color.secondary)
                ], for: .normal)
            }
        .pickerStyle(.segmented)
        .padding()
    }

    var top: some View {
        HStack(alignment: .top) {
            Text("Ачівки")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title.weight(.bold))
                .padding(.leading, 20)
                .foregroundStyle(.linearGradient(colors: [.accentColor, .accentColor.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))

            Button {
                self.presentedAsModal = false
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)

        }
        .frame(maxWidth: .infinity, maxHeight: 30, alignment: .topTrailing)
        .padding(.top, 20)
        .padding(.trailing, 20)
        .opacity(appear[1] ? 1 : 0)
        .offset(y: appear[1] ? 0 : -200)
    }

}

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView(presentedAsModal: .constant(true))
    }
}

//
//  ModalView.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 17.09.2022.
//

import SwiftUI

struct ModalView: View {
    @EnvironmentObject var model: Model
    @State var viewState: CGSize = .zero
    @State var isDismissed = false

    var body: some View {
        ZStack {
            Color.clear.background(.regularMaterial)
                .ignoresSafeArea()

            Group {
                AuthenticationView()
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .offset(x: viewState.width, y: viewState.height)
            .offset(y: isDismissed ? 1000 : 0)
            .rotationEffect(.degrees(viewState.width/40))
            .rotation3DEffect(.degrees(viewState.height/20), axis: (x: 1, y: 0, z: 0))
            .hueRotation(.degrees(viewState.width/5))
            .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
            .padding(20)
            .background(
                Image("BlueSpot")
                    .allowsHitTesting(false)
                    .accessibility(hidden: true)
            )
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .environmentObject(Model())
    }
}

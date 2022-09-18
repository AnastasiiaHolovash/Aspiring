//
//  MyAdvertisement.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-18.
//

import SwiftUI

struct MyAdvertisements: View {
    @State var showDetails = false
    @State var selectedIndex = 0

    @EnvironmentObject var model: Model

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()

            ScrollView {
                sectionsSection
            }
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(NavigationBar(title: "Ось що ти робиш", hasScrolled: .constant(true)))
            .background(Image("BlueSpot").offset(x: -180, y: 300))
        }
    }

    var sectionsSection: some View {
        VStack(alignment: .leading) {
            AdvertisementView(advertisement: createAdvertisement)
                .background(Color.cyan.opacity(0.5))
            
            ForEach(Array(model.myAdvertisements.enumerated()), id: \.offset) { index, advertisement in
                if index != 0 { Divider() }
                AdvertisementView(advertisement: advertisement)
                    .onTapGesture {
                        selectedIndex = index
                        showDetails = true
                    }
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
        .sheet(isPresented: $showDetails) {
            AdvertisementDetailsView(
                advertisement: model.myAdvertisements[selectedIndex],
                showIWillVisit: false
            )
        }
    }
}

struct MyAdvertisement_Previews: PreviewProvider {
    static var previews: some View {
        MyAdvertisements()
    }
}

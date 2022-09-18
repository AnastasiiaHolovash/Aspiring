//
//  CatsRewardsView.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 18.09.2022.
//

import SwiftUI

struct CatsRewardsView: View {

    @State var appear = [false, false, false]

    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            ScrollView {
                mainCat
                scins
                wearpons
                food
            }
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
    }

    var mainCat: some View {
        HStack {
            CatView()
                .padding(.bottom)
        }

    }

    var scins: some View {
        HStack {
            CatAdditionalsView(title: "Скіни", additions: catScins)
                .padding(.bottom)
        }

    }

    var wearpons: some View {
        HStack {
            CatAdditionalsView(title: "ЗСУ-кіт", additions: catWeapon)
                .padding(.bottom)
        }

    }

    var food: some View {
        HStack {
            CatAdditionalsView(title: "Нагодуй", additions: catFood)
                .padding(.bottom)
        }

    }

}

struct CatsRewardsView_Previews: PreviewProvider {
    static var previews: some View {
        CatsRewardsView()
    }
}

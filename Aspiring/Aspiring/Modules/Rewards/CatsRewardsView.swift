//
//  CatsRewardsView.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 18.09.2022.
//

import SwiftUI

struct CatsRewardsView: View {

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

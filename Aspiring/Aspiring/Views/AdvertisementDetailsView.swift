//
//  AdvertisementDetailsView.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-18.
//

import SwiftUI

struct AdvertisementDetailsView: View {
    var advertisement: Advertisement = advertisements[0]

    @EnvironmentObject var model: Model
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(advertisement.title)
                            .font(.largeTitle.weight(.bold))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("Субота 25 вер 9:00-14:00".uppercased())
                            .font(.footnote.weight(.semibold))

                        Text(advertisement.subtitle)
                            .font(.footnote)

                        Divider()

                        HStack {
                            Text("\(advertisement.alreadyDone)/\(advertisement.limit) уже зібрано")
                                .font(.callout)
                                .bold()

                            Spacer()

                            Image(advertisement.type.imageName)
                                .frame(width: 36, height: 36)
                                .mask(Circle())
                                .padding(12)
                                .background(Color(UIColor.systemBackground).opacity(0.3))
                                .mask(Circle())
                                .overlay(ProgressView(value: advertisement.progress))
                        }
                        .padding(.trailing, 20)

                    }
                    .padding(20)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    )
                    .offset(y: 50)
                    .padding(20)
                    .frame(height: 400)

                    Spacer()

                    VStack(alignment: .leading, spacing: 30) {
                        Text("Детальніше")
                            .font(.title).bold()

                        Text(advertisement.details)
                    }
                    .padding(20)
                }
                .background(
                    Image("BlueSpot")
                        .offset(x: 200, y: 100)
                        .accessibility(hidden: true)
                )
            }
            .background(Color("Background"))
            .ignoresSafeArea()

            button
        }
    }

    var button: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        AdvertisementDetailsView()
    }
}

//
//  QRScreenView.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-18.
//

import SwiftUI

struct QRScreenView: View {

    @EnvironmentObject var model: Model
    let qrImage: Image

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("QR")
                    .font(.title.weight(.bold))
                    .padding(.leading, 20)
                    .foregroundStyle(
                        .linearGradient(
                            colors: [
                                .accentColor,
                                .accentColor.opacity(0.5)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )

                Spacer()

                Button {
                    model.showQR = false
                } label: {
                    Image(systemName: "xmark")
                        .font(.body.weight(.bold))
                        .foregroundColor(.secondary)
                        .padding(8)
                        .background(.ultraThinMaterial, in: Circle())
                }
            }
            .padding(20)

            Text("Розмісти цей код у місці виконання задачі, щоб люди могли тобі допомогти")
                .font(.system(size: 20, weight: .bold))
                .padding(20)

            Spacer()

            qrImage
                .frame(width: 200, height: 200)

            Text("Поділитися")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.blue)
                .padding(20)
                .padding(20)

            Spacer()
        }
    }
}

//
//  Model.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-17.
//

import SwiftUI
import Combine

class Model: ObservableObject {
    @Published var showQR: Bool = false
    @Published var showCreateTask: Bool = false

    @Published var advertisements = [
        Advertisement(
            title: "Корм для котиків 🐱",
            type: .donation,
            subtitle: "м. Київ вул. Жилянська 59",
            limit: 2000,
            alreadyDone: 0,
            details: "-"
        ),
        Advertisement(
            title: "Пакувальний центр",
            type: .work,
            subtitle: "м. Київ вул. Жилянська 59",
            limit: 20,
            alreadyDone: 15,
            details: "Потрібно складати пакунки з їжею, які будуть відвезені у прифронтову зону. \n\nЗа можливістю принесіть їжу, яка довго не псується."
        ),
        Advertisement(
            title: "Купуємо флісовий одяг",
            type: .donation,
            subtitle: "20 000$",
            limit: 2,
            alreadyDone: 1,
            details: "Потрібно складати пакунки з їжею, які будуть відвезені у прифронтову зону. \n\nЗа можливістю принесіть їжу, яка довго не псується."
        ),
        Advertisement(
            title: "Збір одягу",
            type: .itemDonation,
            subtitle: "м. Київ вул. Жилянська 59",
            limit: 6,
            alreadyDone: 2,
            details: ""
        ),
        Advertisement(
            title: "Купуємо флісовий одяг",
            type: .donation,
            subtitle: "2300$",
            limit: 400,
            alreadyDone: 37,
            details: ""
        )
    ]

    @Published var myAdvertisements = [
        Advertisement(
            title: "Купуємо флісовий одяг",
            type: .donation,
            subtitle: "20 000$",
            limit: 20,
            alreadyDone: 3,
            details: "Потрібно складати пакунки з їжею, які будуть відвезені у прифронтову зону. \n\nЗа можливістю принесіть їжу, яка довго не псується."
        ),
        Advertisement(
            title: "Купуємо флісовий одяг",
            type: .donation,
            subtitle: "2300$",
            limit: 20,
            alreadyDone: 15,
            details: "Потрібно складати пакунки з їжею, які будуть відвезені у прифронтову зону. \n\nЗа можливістю принесіть їжу, яка довго не псується."
        )
    ]

    @Published var welcome = Welcome(
        title: "Привіт, Олег",
        stars: 100
    )

    static func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                let image = UIImage(ciImage: output)
                return UIImage(ciImage: output)
            }
        }

        return nil
    }
}

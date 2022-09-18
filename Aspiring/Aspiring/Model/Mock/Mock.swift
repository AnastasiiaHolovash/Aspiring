//
//  Mock.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-17.
//

import Foundation

var advertisements = [
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

var myAdvertisements = [
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

let welcome = Welcome(
    title: "Привіт, Олег",
    stars: 195
)

let createAdvertisement = Advertisement(
    title: "Створити задачу",
    type: .create,
    subtitle: "",
    limit: 1,
    alreadyDone: 0,
    details: ""
)

var tasks: [Task] = []

var catScins: [CatAddition] = [
    CatAddition(emoji: "🐈‍⬛", price: "50"),
    CatAddition(emoji: "🐈", price: "40"),
    CatAddition(emoji: "🐆", price: "30"),
    CatAddition(emoji: "🐅", price: "20")
]

var catWeapon: [CatAddition] = [
    CatAddition(emoji: "🔫", price: "22"),
    CatAddition(emoji: "🪖", price: "444"),
    CatAddition(emoji: "🧨", price: "424"),
    CatAddition(emoji: "💣", price: "23")
]

var catFood: [CatAddition] = [
    CatAddition(emoji: "🍔", price: "20"),
    CatAddition(emoji: "🐟", price: "40"),
    CatAddition(emoji: "🐠", price: "60"),
    CatAddition(emoji: "🍣", price: "99")
]

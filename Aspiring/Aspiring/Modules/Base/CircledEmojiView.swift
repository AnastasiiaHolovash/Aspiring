//
//  CircledEmojiView.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 18.09.2022.
//

import SwiftUI

struct CircledEmojiView: View {

    @State var emoji: String

    var body: some View {
        return GeometryReader { geometry in 
            BackgroundRing()
                .stroke(Color.red,
                        style:  StrokeStyle(lineWidth: geometry.size.width < geometry.size.height ? geometry.size.width / 12.0 :  geometry.size.height / 12))
                                .shadow(radius: 30.0, x: -30.0, y: -30.0)
                                .aspectRatio(contentMode: .fit)
        }
    }
}

struct BackgroundRing : Shape {
     func path(in rect: CGRect) -> Path {
        var path: Path = Path()

        let radiusOfRing: CGFloat = (rect.width < rect.height ? rect.width/2 - rect.width / 12 : rect.height/2 - rect.height / 12)
        path.addRelativeArc(center: CGPoint(x: rect.width/2, y: rect.height/2),
                                radius: radiusOfRing,
                                startAngle: Angle(radians: 0.0),
                                delta: Angle(radians: Double.pi * 2.0 ))

        return path
    }
}

struct CircledEmojiView_Previews: PreviewProvider {
    static var previews: some View {
        CircledEmojiView(emoji: "🐈‍⬛")
    }
}

//
//  CreateTaskTextsItem.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 17.09.2022.
//

import SwiftUI

struct CreateTaskTextsItem: View {

    enum Field: Hashable {
        case title
        case description
    }

    @Environment(\.sizeCategory) var sizeCategory
    @FocusState var focusedField: Field?

    @ObservedObject var title: CreateTaskTextObject
    @ObservedObject var description: CreateTaskTextObject

    @State var appear = [false, false, false]

    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {

            Group {
                HStack(spacing: 8) {
                    Text("🐈‍⬛")
                        .font(.title)
                        .foregroundStyle(.secondary)
                        .frame(width: 51, height: 51)
                        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .frame(maxWidth: .maximum(51, 0), alignment: .leading)
                        .padding(0)
                    TextField("Назва", text: $title.text)
                        .inputStyle(emoji: "🪶")
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .focused($focusedField, equals: .title)
                        .shadow(color: focusedField == .title ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                        .overlay(geometry)
//                        .onPreferenceChange(CirclePreferenceKey.self) { value in
//                            phoneY = value
//                            circleY = value
//                        }
                }
                TextEditorView(string: $description.text)
                    .padding(15)
                    .font(.body.weight(.regular))
                    .padding(.leading, 0)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .strokeStyle(cornerRadius: 20)
                    .autocapitalization(.sentences)
                    .focused($focusedField, equals: .description)
                    .shadow(color: focusedField == .description ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                    .overlay(geometry)
                
            }

            .coordinateSpace(name: "container")
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
    }

    var geometry: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: CirclePreferenceKey.self, value: proxy.frame(in: .named("container")).minY)
        }
    }

}

struct CreateTaskTextsItem_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskTextsItem(title: CreateTaskTextObject(), description: CreateTaskTextObject())
            .environment(\.sizeCategory, .extraExtraLarge)
    }
}

//
//  TextEditorView.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 18.09.2022.
//

import SwiftUI

struct TextEditorView: View {

    @Binding var string: String
    @State private var textEditorHeight : CGFloat = CGFloat()

    init(string: Binding<String>) {
        self._string = string
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {

        ZStack(alignment: .leading) {

            Text(string)
                .lineLimit(5)
                .foregroundColor(.clear)
                .padding(.top, 5.0)
                .padding(.bottom, 7.0)
                .background(GeometryReader {
                    Color.clear.preference(key: ViewHeightKey.self,
                                           value: $0.frame(in: .local).size.height)
                })

            TextEditor(text: $string)
                .frame(height: textEditorHeight)

        }
        .onPreferenceChange(ViewHeightKey.self) { textEditorHeight = $0 }

    }

}

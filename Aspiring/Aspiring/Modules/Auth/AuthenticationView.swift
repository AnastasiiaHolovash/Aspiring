//
//  AuthenticationView.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 17.09.2022.
//
import SwiftUI

struct AuthenticationView: View {
    enum Field: Hashable {
        case phone
        case code
    }

    @State var phone = ""
    @State var code = ""
    @FocusState var focusedField: Field?
    @State var circleY: CGFloat = 0
    @State var phoneY: CGFloat = 0
    @State var codeY: CGFloat = 0
    @State var circleColor: Color = .blue
    @State var isCodeSent = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Увійти")
                .font(.largeTitle).bold()
            Text("Введіть номер телефону та отриманий код з смс")
                .font(.headline)

            Group {
                TextField("+380", text: $phone)
                    .inputStyle(emoji: "📱")
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .focused($focusedField, equals: .phone)
                    .overlay(geometry)
                    .onPreferenceChange(CirclePreferenceKey.self) { value in
                        phoneY = value
                        circleY = value
                    }
                if isCodeSent {
                    SecureField("*****", text: $code)
                        .inputStyle(emoji: "🔑")
                        .textContentType(.oneTimeCode)
                        .focused($focusedField, equals: .code)
                        .shadow(color: focusedField == .code ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                        .overlay(geometry)
                        .onPreferenceChange(CirclePreferenceKey.self) { value in
                            codeY =  value
                        }
                    Button {
                        isCodeSent = true
                    } label: {
                        Text("Отримати код")
                            .frame(maxWidth: .infinity)
                    }
                    .font(.headline)
                    .blendMode(.overlay)
                    .buttonStyle(.angular)
                    .tint(.accentColor)
                    .controlSize(.large)
                    .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)

                    Divider()

                    HStack {
                        Text("Не отримали код?")
                        Button {
                            // TODO: - Resend code api call
                        } label: {
                            Text("Відправити ще раз")
                        }
                    }
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .accentColor(.secondary)
                } else {
                    Button {
                        isCodeSent = true
                    } label: {
                        Text("Отримати код")
                            .frame(maxWidth: .infinity)
                    }
                    .font(.headline)
                    .blendMode(.overlay)
                    .buttonStyle(.angular)
                    .tint(.accentColor)
                    .controlSize(.large)
                    .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
                }

            }
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .background(
            Circle().fill(circleColor)
                .frame(width: 68, height: 68)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(y: circleY)
        )
        .coordinateSpace(name: "container")
        .strokeStyle(cornerRadius: 30)
        .onChange(of: focusedField) { value in
            withAnimation {
                if value == .phone {
                    circleY = phoneY
                    circleColor = .blue
                } else {
                    circleY = codeY
                    circleColor = .red
                }
            }
        }
    }

    var geometry: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: CirclePreferenceKey.self, value: proxy.frame(in: .named("container")).minY)
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AuthenticationView()
                .environmentObject(Model())
        }
    }
}


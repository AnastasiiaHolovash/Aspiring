//
//  CreateTaskView.swift
//  Aspiring
//
//  Created by Yelyzaveta Kartseva on 17.09.2022.
//

import SwiftUI

struct CreateTaskView: View {

    enum Field: Hashable {
        case city
        case street
        case house
        case goal
    }

    @AppStorage("isLiteMode") var isLiteMode = true
    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = true
    @FocusState var focusedField: Field?

    @State var title: String = ""
    @State var type: AdvertisementType = .donation
    @State var description: String = ""
    @State var emoji: Emoji? // if time left

    @State var city: String = ""
    @State var street: String = ""
    @State var houseNumber: String = ""

    @State var goal: String = ""

    @State var appear = [false, false, false]

    var isFilled: Bool {
        if title.isEmpty ||
            description.isEmpty ||
            goal.isEmpty {
            return false
        }
        if type != .donation {
            if city.isEmpty ||
                street.isEmpty ||
                houseNumber.isEmpty {
                return false
            }
        }
        return true
    }
    

    var body: some View {
        GeometryReader { proxy in
            VStack {
                let minX = proxy.frame(in: .global).minX
                scrollDetection
                Text("Створи")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title.weight(.bold))
                    .padding(.top, 20)
                    .padding(.leading, 20)
                    .foregroundStyle(.linearGradient(colors: [.accentColor, .accentColor.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                texts
                ScrollView {

                    Text("Категорія")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3.weight(.medium))
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    categories

                    if type != .donation {
                    Text("Локація")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3.weight(.medium))
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        locations
                        .padding()
                    }
                    Text("Мета")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3.weight(.medium))
                        .keyboardType(.numberPad)
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    TextField(type.equialent.placeholder, text: $goal)
                        .inputStyle(emoji: type.equialent.emoji)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .focused($focusedField, equals: .goal)
                        .shadow(color: focusedField == .goal ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                        .padding(.horizontal, 20)
                    Button {
//                        isCodeSent = true
//                        let task = Task(title: <#T##String#>, type: <#T##AdvertisementType#>, description: <#T##String#>, emoji: <#T##Emoji?#>, city: <#T##String?#>, street: <#T##String?#>, houseNumber: <#T##String?#>, goal: <#T##Int#>, equivalentType: <#T##EquialentType#>)

                    } label: {
                        Text("Отримати код")
                            .frame(maxWidth: .infinity)
                    }
                    .font(.headline)
                    .blendMode(.overlay)
                    .if(isFilled, transform: { view in
                        view
                            .buttonStyle(.angular)
                    })
                    .if(!isFilled, transform: { view in
                        view
                            .buttonStyle(.disabledAngular)
                    })
                    .padding()
                    .disabled(true)
                    .controlSize(.large)
                    .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)

                }.frame(minWidth: 100, maxWidth: .infinity, minHeight: proxy.size.height, alignment: .top)
                    .shadow(color: Color("Shadow").opacity(isLiteMode ? 0 : 0.3), radius: 5, x: 0, y: 3)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                    .blur(radius: abs(minX / 40))
                    .padding(.top, 0)
            }
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .background(
            Image("Blob 1")
                .opacity(appear[2] ? 1 : 0)
                .offset(y: appear[2] ? 0 : 10)
                .blur(radius: appear[2] ? 0 : 40)
                .allowsHitTesting(false)
                .accessibility(hidden: true)
        )
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.windows
                        .first { $0.isKeyWindow }?
                        .endEditing(true)
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

    var texts: some View {
        CreateTaskTextsItem(title: title, description: description)
            .padding()
    }

    var categories: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(AdvertisementType.allCases) { type in
                    CategoryItemView(category: type, isSelected: type == self.type)
                        .onTapGesture {
                            self.type = type
                        }
                }
            }
            .padding(.top, 20)
            .padding(.leading, 20)
            Spacer()
        }
    }

    var locations: some View {
        VStack {
            TextField("Місто", text: $city)
                .inputStyle(emoji: "🌆")
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .focused($focusedField, equals: .city)
                .shadow(color: focusedField == .city ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
            TextField("Вулиця", text: $street)
                .inputStyle(emoji: "📍")
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .focused($focusedField, equals: .street)
                .shadow(color: focusedField == .street ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
            TextField("Дім", text: $houseNumber)
                .inputStyle(emoji: "🏘")
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .focused($focusedField, equals: .house)
                .shadow(color: focusedField == .house ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
        }
    }

    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
    }

}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView()
            .environmentObject(Model())
    }
}

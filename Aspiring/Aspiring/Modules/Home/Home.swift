//
//  Home.swift
//  Aspiring
//
//  Created by Anastasia Holovash on 2022-09-17.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = true
    @State var selectedID = UUID()
    @State var showDetails = false
    @State var showPet = false
    @State var selectedIndex = 0
    @EnvironmentObject var model: Model
    @AppStorage("isLiteMode") var isLiteMode = true

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()

            ScrollView {
                scrollDetection

                welcomeView

                Text("Ось чим ти можеш допомогти сьогодні".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)

                content
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Aspirng", hasScrolled: $hasScrolled)
            )
        }
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

    var welcomeView: some View {
        TabView {
            ForEach(Array(model.advertisements.enumerated()), id: \.offset) { index, advertisement in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX

                    WelcomeView(welcomeData: model.welcome)
                        .frame(maxWidth: 500)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(isLiteMode ? 0 : 0.3), radius: 5, x: 0, y: 3)
                        .blur(radius: abs(minX / 40))
                        .onTapGesture {
                            showPet = true
                            selectedIndex = index
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityAddTraits(.isButton)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 360)
        .background(
            Image("BlueSpot")
                .offset(x: 250, y: -100)
                .accessibility(hidden: true)
        )
        .sheet(isPresented: $showPet) {
            // TODO: Open Pet
        }
    }

    var content: some View {
        VStack(alignment: .leading) {
            ForEach(Array(model.advertisements.enumerated()), id: \.offset) { index, advertisement in
                if index != 0 { Divider() }
                AdvertisementView(advertisement: advertisement)
                    .onTapGesture {
                        selectedIndex = index
                        showDetails = true
                    }
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
        .sheet(isPresented: $showDetails) {
            AdvertisementDetailsView(
                advertisement: model.advertisements[selectedIndex],
                showIWillVisit: true
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Model())
    }
}

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

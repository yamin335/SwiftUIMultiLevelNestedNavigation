//
//  ContentView.swift
//  SwiftUIMultiLevelNestedNavigation
//
//  Created by Md. Yamin on 11.05.23.
//

import SwiftUI

struct MenuButton: View {
    let label: String
    
    var body: some View {
        Text(label)
            .foregroundColor(.white)
            .font(.system(size: 24))
            .padding(10)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 5, style: .circular)
                    .fill(.mint)
            )
    }
}

struct FastFood: Identifiable, Hashable {
    let name: String
    var id: String {name}
}

struct Cloth: Identifiable, Hashable {
    let name: String
    var id: String {name}
}

let listOfSnacks: [FastFood] = [
    .init(name: "🍟 Fries"),
    .init(name: "🍔 Burger"),
    .init(name: "🍖 Kebab")
]

let listOfCloths: [Cloth] = [
    .init(name: "👕 Shirt"),
    .init(name: "👗 Dress"),
    .init(name: "🩳 Short")
]

struct ContentView: View {
    @State var path: NavigationPath = .init()
    var body: some View {
        NavigationStack(path: $path.animation(.easeOut)) {
            VStack {
                Button(action: {
                    path.append(FoodItemListView.tag)
                }) {
                    MenuButton(label: "Yummy Foods 🍕")
                }
                
                NavigationLink(value: ClothItemListView.tag) {
                    MenuButton(label: "Fashionable Cloths 🛍️")
                }
            }.navigationTitle("SwiftUI Navigations")
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .navigationDestination(for: String.self) { tag in
                if tag == FoodItemListView.tag {
                    FoodItemListView(path: $path)
                } else if tag == ClothItemListView.tag {
                    ClothItemListView(path: $path)
                }
            }.navigationDestination(for: FastFood.self) { foodItem in
                FoodItemDetailsView(foodItem: foodItem, path: $path)
            }.navigationDestination(for: Cloth.self) { clothItem in
                ClothItemDetailsView(clothItem: clothItem, path: $path)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  FoodItemListView.swift
//  SwiftUIMultiLevelNestedNavigation
//
//  Created by Md. Yamin on 11.05.23.
//

import SwiftUI

struct ListItem: View {
    let label: String
    
    var body: some View {
        Text(label)
            .font(.system(size: 24, weight: .regular))
            .foregroundColor(.blue)
            .padding(.horizontal, 15)
            .padding(.vertical, 6)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 5, style: .circular)
                    .stroke(.blue, lineWidth: 1)
            )
    }
}

struct FoodItemListView: View {
    static let tag = "FoodItemListView"
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            ForEach(Array(listOfSnacks.enumerated()), id: \.offset) { index, item in
                Button(action: {
                    path.append(item)
                }) {
                    ListItem(label: item.name)
                }
            }
        }.navigationTitle("Yummy Foods 🍕")
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
    }
}

struct FoodItemListView_Previews: PreviewProvider {
    @State static var path: NavigationPath = .init()
    static var previews: some View {
        FoodItemListView(path: $path)
    }
}

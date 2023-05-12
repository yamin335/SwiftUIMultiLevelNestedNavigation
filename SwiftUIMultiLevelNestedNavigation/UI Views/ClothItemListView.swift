//
//  ClothItemListView.swift
//  SwiftUIMultiLevelNestedNavigation
//
//  Created by Md. Yamin on 11.05.23.
//

import SwiftUI

struct ClothItemListView: View {
    static let tag = "ClothItemListView"
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            ForEach(Array(listOfCloths.enumerated()), id: \.offset) { index, item in
                NavigationLink(value: item) {
                    ListItem(label: item.name)
                }
            }
        }.navigationTitle("Fashionable Cloths 🛍️")
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
    }
}

struct ClothItemListView_Previews: PreviewProvider {
    @State static var path: NavigationPath = .init()
    static var previews: some View {
        ClothItemListView(path: $path)
    }
}

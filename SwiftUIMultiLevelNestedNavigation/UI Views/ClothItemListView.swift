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
                Button(action: {
                    path.append(item)
                }) {
                    Text(item.name)
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

//
//  ClothItemDetailsView.swift
//  SwiftUIMultiLevelNestedNavigation
//
//  Created by Md. Yamin on 11.05.23.
//

import SwiftUI

struct ClothItemDetailsView: View {
    let clothItem: Cloth
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text(clothItem.name)
                .font(.system(size: 60, weight: .black))
                .padding(.top, 40)
            
            Text("Related fashionable Items")
                .padding(.top, 40)

            HStack {
                ForEach(Array(listOfCloths.enumerated()), id: \.offset) { index, item in
                    NavigationLink(value: item) {
                        RelatedListItem(label: item.name)
                    }
                }
            }
            
            Button(action: {
                while path.count > 1 {
                    path.removeLast()
                }
            }) {
                BackButton(label: "Back to the list")
            }.padding(40)
            
            Spacer()
        }.padding()
    }
}

struct ClothItemDetailsView_Previews: PreviewProvider {
    @State static var path: NavigationPath = .init()
    static var previews: some View {
        ClothItemDetailsView(clothItem: .init(name: "👕 Shirt"), path: $path)
    }
}

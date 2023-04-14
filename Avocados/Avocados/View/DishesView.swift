//
//  DishesView.swift
//  Avocados
//
//  Created by user219285 on 4/1/23.
//

import SwiftUI

struct DishesView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            
            //MARK: - 1st column
            VStack(alignment: .leading, spacing: 5) {
                LeftRowView(iconImage: imageIconToast, title: "Toast")
                Divider()
                LeftRowView(iconImage: imageIconTacos, title: "Tacos")
                Divider()
                LeftRowView(iconImage: imageIconSalads, title: "Salads")
                Divider()
                LeftRowView(iconImage: imageIconHalfavo, title: "Spreads")
            }
            
            //MARK: - 2nd column
            VStack(alignment: .center, spacing: 15) {
                HStack {
                    Divider()
                }
                Image(systemName: "heart.circle")
                    .font(.title.weight(.ultraLight))
                    .imageScale(.large)
                HStack {
                    Divider()
                }
            }
            
            //MARK: - 3rd column
            VStack(alignment: .trailing, spacing: 5) {
                RightRowView(title: "Guacamole", iconImage: imageIconGuacamole)
                Divider()
                RightRowView(title: "Sandwich", iconImage: imageIconSandwich)
                Divider()
                RightRowView(title: "Soup", iconImage: imageIconSoup)
                Divider()
                RightRowView(title: "Smoothie", iconImage: imageIconSmoothie)
            }
            
        }
        .font(.system(.callout, design: .serif))
        .foregroundColor(.gray)
        .padding(.horizontal)
        .frame(maxHeight: 220)
    }
}

struct IconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 40, height: 40, alignment: .center)
    }
}

struct LeftRowView: View {
    var iconImage: Image
    var title: String
    var body: some View {
        HStack {
            iconImage
                .resizable()
                .modifier(IconModifier())
            Spacer()
            Text(title)
        }
    }
}

struct RightRowView: View {
    var title: String
    var iconImage: Image
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            iconImage
                .resizable()
                .modifier(IconModifier())
        }
    }
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView()
    }
}


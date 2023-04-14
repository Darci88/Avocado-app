//
//  SettingsView.swift
//  Avocados
//
//  Created by user219285 on 4/1/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var enableNotification: Bool = true
    @State private var backgroundRefresh: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            //MARK: - Header
            VStack(alignment: .center, spacing: 5) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: colorBlackTransparentLight, radius: 8, x: 0, y: 4)
                
                Text("Avocados".uppercased())
                    .font(.system(.title, design: .serif, weight: .bold))
                .foregroundColor(colorGreenAdaptive)
            }
            .padding()
            
            Form {
                //MARK: - Section #1
                Section(header: Text("General Settings")) {
                    Toggle(isOn: $enableNotification) {
                        Text("Enable notification")
                    }
                    
                    Toggle(isOn: $backgroundRefresh) {
                        Text("Background refresh")
                    }
                }
                
                //MARK: - Section #2
                Section(header: Text("Application")) {
                    if enableNotification {
                        InfoRowView(firstItem: "Product", secondItem: "Avocado Recipes")
                        InfoRowView(firstItem: "Compatibility", secondItem: "iPhone & iPad")
                        InfoRowView(firstItem: "Developer", secondItem: "Daria")
                        InfoRowView(firstItem: "Designer", secondItem: "Robert Petras")
                        InfoRowView(firstItem: "Website", secondItem: "swiftuimasterclass.com")
                        InfoRowView(firstItem: "Version", secondItem: "1.0.0")
                        
                    } else {
                        InfoRowView(firstItem: "Personal message", secondItem: "Happy Coding!")
                    }
                }
            }
        }
        .frame(maxWidth: 640)
    }
}

struct InfoRowView: View {
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem).foregroundColor(.gray)
            Spacer()
            Text(secondItem)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


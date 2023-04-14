//
//  RecipeCardView.swift
//  Avocados
//
//  Created by user219285 on 4/1/23.
//

import SwiftUI

struct RecipeCardView: View {
    var recipe: Recipe
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State private var showModal: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            //MARK: - Card image
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "bookmark")
                                .font(.title.weight(.light))
                                .foregroundColor(.white)
                                .imageScale(.small)
                                .shadow(color: colorBlackTransparentLight, radius: 2, x: 0, y: 0)
                                .padding(.trailing, 20)
                                .padding(.top, 20)
                            Spacer()
                        }
                    }
                )
            
            VStack(alignment: .leading, spacing: 12) {
                //MARK: - Title
                Text(recipe.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(colorGreenMedium)
                    .lineLimit(1)
                
                //Headline
                Text(recipe.headline)
                    .font(.system(.body, design: .serif))
                    .foregroundColor(.gray)
                    .italic()
                
                //Rates
                RecipeRatingView(recipe: recipe)
                
                //MARK: - Cooking
                RecipeCookingView(recipe: recipe)
            }
            .padding()
            .padding(.bottom)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: colorBlackTransparentLight, radius: 10, x: 0, y: 0)
        .onTapGesture {
            hapticImpact.impactOccurred()
            showModal = true
        }
        .sheet(isPresented: $showModal) {
            RecipeDetailView(recipe: recipe)
        }
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: recipesData[0])
    }
}

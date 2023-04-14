//
//  RipeningView.swift
//  Avocados
//
//  Created by user219285 on 4/1/23.
//

import SwiftUI

struct RipeningView: View {
    var ripening: Ripening
    @State private var slideInAnimation: Bool = false
    
    var body: some View {
        VStack {
            Image(ripening.image)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(Circle())
                .background(
                    Circle()
                        .fill(colorGreenLight)
                        .frame(width: 110, height: 110, alignment: .center)
                )
                .background(
                    Circle()
                        .fill(colorAppearanceAdaptive)
                        .frame(width: 120, height: 120, alignment: .center)
                )
                .zIndex(1)
                .animation(.easeInOut(duration: 1), value: slideInAnimation)
                .offset(y: slideInAnimation ? 55 : -55)
            
            VStack(alignment: .center, spacing: 10) {
                //Stage
                VStack(alignment: .center, spacing: 0) {
                    Text(ripening.stage)
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.bold)
                    Text("STAGE")
                        .font(.system(.body, design: .serif))
                        .fontWeight(.heavy)
                }
                .foregroundColor(colorGreenMedium)
                .padding(.top, 65)
                .frame(width: 180)
                
                //MARK: - Title
                Text(ripening.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(colorGreenMedium)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 0)
                    .frame(width: 220)
                    .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient(gradient: Gradient(colors: [.white, colorGreenLight]), startPoint: .top, endPoint: .bottom))
                        .shadow(color: colorBlackTransparentLight, radius: 6, x: 0, y: 6)
                    )
                
                //Description
                Spacer()
                Text(ripening.description)
                    .foregroundColor(colorGreenDark)
                    .fontWeight(.bold)
                    .lineLimit(nil)
                Spacer()
                
                //MARK: - Ripeness
                Text(ripening.ripeness.uppercased())
                    .foregroundColor(.white)
                    .font(.system(.callout, design: .serif, weight: .bold))
                    .shadow(radius: 3)
                    .padding(.vertical)
                    .padding(.horizontal, 0)
                    .frame(width: 185)
                    .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient(gradient: Gradient(colors: [colorGreenMedium, colorGreenDark]), startPoint: .top, endPoint: .bottom))
                        .shadow(color: colorBlackTransparentLight, radius: 6, x: 0, y: 6)
                    )
                
                //Instruction
                Text(ripening.instruction)
                    .font(.footnote)
                    .foregroundColor(colorGreenLight)
                    .fontWeight(.bold)
                    .lineLimit(3)
                    .frame(width: 160)
                Spacer()
            }
            .zIndex(0)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .frame(width: 260, height: 485, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: [colorGreenLight, colorGreenMedium]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            slideInAnimation.toggle()
        }
    }
}

struct RipeningView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningView(ripening: ripeningData[1])
    }
}

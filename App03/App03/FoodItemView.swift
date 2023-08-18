//
//  FoodItemView.swift
//  App001
//
//  Created by Alumno on 11/08/23.
//

import SwiftUI

struct FoodItemView: View {
    let food : FoodModel
    
    var body: some View {
        ZStack {
            Image(food.nombreImagen)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .overlay(alignment: .bottomTrailing, content: {
                    Text(food.titulo)
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .shadow(radius: 5)
                        .padding()
                })
                .padding()
            if food.isFavorite {
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .foregroundColor(.yellow)
                    .shadow(radius: 5)
                    .padding()
                    .offset(x: -150, y: -70)
            }
            else {
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .foregroundColor(.yellow)
                    .shadow(radius: 5)
                    .padding()
                    .offset(x: -150, y: -70)
            }
        }
    } // body
}

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemView(food: FoodModel.defaultFood)
    }
}

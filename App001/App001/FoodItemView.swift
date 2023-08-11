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
    } // body
}

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemView(food: FoodModel.defaultFood)
    }
}

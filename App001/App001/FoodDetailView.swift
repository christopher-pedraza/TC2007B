//
//  FoodDetailView.swift
//  App001
//
//  Created by Alumno on 11/08/23.
//

import SwiftUI

struct FoodDetailView: View {
    let food: FoodModel
    
    var body: some View {
        VStack {
            Image(food.nombreImagen)
                .resizable()
                .scaledToFit()
                .frame(width: 300)
                .clipShape(Circle())
                .shadow(radius: 7)
                .offset(y: -80)
            
            Text(food.titulo)
                .font(.title)
                .bold()
                .foregroundColor(.cyan)
                .offset(y: -55)
            
            Text(food.descripcion)
                .multilineTextAlignment(.center)
                .padding()
                .offset(y: -25)
            
            Link(destination: URL(string: food.url)!, label: {
                Label("Sitio Web", systemImage: "globe")
            })
        }
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(food: FoodModel.defaultFood)
    }
}

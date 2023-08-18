//
//  FoodModel.swift
//  App001
//
//  Created by Alumno on 11/08/23.
//

import Foundation

// Creamos un modelo que pueda ser identificable (tenga un id)
struct FoodModel : Identifiable {
    // Con UUID, swiftUI ya nos crea un id unico
    var id = UUID()
    var titulo: String
    var descripcion: String
    var url: String
    var nombreImagen: String
    var isFavorite: Bool
}

// Valores default para probar
extension FoodModel {
    public static var defaultFood = FoodModel(titulo: "Brownies", descripcion: "We've got so many variations on the classic chocolate brownie recipe - whether you like white chocolate, nuts, cookies or cheesecake swirls.", url: "https://www.bbc.co.uk/food/chocolate_brownies", nombreImagen: "brownie", isFavorite: false)
}

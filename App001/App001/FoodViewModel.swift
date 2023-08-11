//
//  FoodViewModel.swift
//  App001
//
//  Created by Alumno on 11/08/23.
//

import Foundation
import SwiftUI

// Con ObservableObject y Published, se puede acceder a nuestro arreglo desde cualquier parte
class FoodViewModel : ObservableObject {
    // Declara arreglo del modelo de comida
    @Published var arrFood = [FoodModel]()
    
    init() {
        getFood()
    }
    
    func getFood() {
        var food: FoodModel
        
        /*
         Crear modelos de comida y agregarlos al arreglo de modelos
         */
        food = FoodModel(titulo: "Brownies", descripcion: "We've got so many variations on the classic chocolate brownie recipe - whether you like white chocolate, nuts, cookies or cheesecake swirls.", url: "https://www.bbc.co.uk/food/chocolate_brownies", nombreImagen: "brownie")
        arrFood.append(food)
        
        food = FoodModel(titulo: "Pancakes", descripcion: "We have a glorious list of delicious pancake recipes, whether you enjoy them on Pancake Day or you're a regular on Saturday morning. The humble pancake is made from a batter of milk (or milk and water), eggs and flour which is then cooked in a frying pan or on a griddle until golden brown on both sides.", url: "https://www.bbc.co.uk/food/pancake", nombreImagen: "pancakes")
        arrFood.append(food)
        
        food = FoodModel(titulo: "Cottage pie", descripcion: "Warming to the tips of your toes, a comforting dish of cottage pie is one of the best things about winter. Make it special with Mary Berry's dauphinoise topped cottage pie, or keep it simple with James Martin's easy cottage pie.", url: "https://www.bbc.co.uk/food/cottage_pie", nombreImagen: "cottage")
        arrFood.append(food)
        
        food = FoodModel(titulo: "Chocolate Cakes", descripcion: "Chocoholics can eat their heart out with this selection of lip-smacking chocolate cake recipes. Towering chocolate fudge cake, decadent chocolate orange cake or a rich chocolate mousse cake?", url: "https://www.bbc.co.uk/food/chocolate_cake", nombreImagen: "cake")
        arrFood.append(food)
        
        food = FoodModel(titulo: "Pasta Salads", descripcion: "Pasta salads are perfect for lunchboxes, picnics and barbecues. Try one of our quick and easy pasta salad recipes, from feta, rocket and olive pasta salad to healthy noodle salads.", url: "https://www.bbc.co.uk/food/pasta_salad", nombreImagen: "salad")
        arrFood.append(food)
    }
}

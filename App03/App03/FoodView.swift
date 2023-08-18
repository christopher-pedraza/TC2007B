//
//  ContentView.swift
//  App001
//
//  Created by Alumno on 11/08/23.
//

import SwiftUI

struct FoodView: View {
    @StateObject var foodVM = FoodViewModel()
    @State private var showFavoritesOnly = false
    
    var filteredFoods: [FoodModel] {
        foodVM.arrFood.filter { food in
            (!showFavoritesOnly || food.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        Toggle(isOn: $showFavoritesOnly) {
                            Text("Favorites only")
                        }
                        .padding()
                        ForEach(filteredFoods) { item in
                            NavigationLink(destination: FoodDetailView(food: item), label: { FoodItemView(food: item)
                            })
                            
                        }
                    } // VStack
                } // ScrollView
                .navigationTitle("Recetas")
            } // ZStack
        } // NavigationView
    } // body
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}

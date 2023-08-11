//
//  ContentView.swift
//  App001
//
//  Created by Alumno on 11/08/23.
//

import SwiftUI

struct FoodView: View {
    @StateObject var foodVM = FoodViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        ForEach(foodVM.arrFood) { item in
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

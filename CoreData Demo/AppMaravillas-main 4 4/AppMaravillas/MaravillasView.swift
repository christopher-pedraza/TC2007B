//
//  ContentView.swift
//  AppMaravillas
//
//  Created by Elvia Rosas on 21/09/22.
//

import SwiftUI

struct MaravillasView: View {
    
    @EnvironmentObject var maravillasVM : MaravillasViewModel
    @Binding var nombre : String
    @State private var showFavoritesOnly = false
    
    var filterMaravillas : [MaravillasModel] {
        maravillasVM.arrMaravillas.filter { maravilla in
            (!showFavoritesOnly || maravilla.isFavorite)
            
        }
    }
    
    var body: some View {
            NavigationView{
                ZStack{
                    Color(.white)
                        .edgesIgnoringSafeArea(.all)
                    ScrollView(.vertical, showsIndicators: false){
                        VStack{
                            Text("Hola \(nombre)")
                          
                            Toggle(isOn: $showFavoritesOnly) {
                                Text("Solo Favoritos")
                            }
                            .frame(width:200)
                            
                            ForEach(filterMaravillas) { item in
                                NavigationLink(destination: MaravillaDetailView(maravilla: item),
                                label: { MaravillaItemView(maravilla: item)})
                                
                            } //Foreach
                        } //VStack
                    }//ScrollView
                }//ZStack
                .navigationTitle("Las Maravillas")
            } //Navigation View
             
            


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MaravillasView(nombre: .constant("Elvia"))
    }
}

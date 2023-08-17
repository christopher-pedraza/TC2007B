//
//  MainView.swift
//  AppMaravillas
//
//  Created by Alumno on 17/08/23.
//

import SwiftUI

struct MainView: View {
    @State var nombre : String
    
    var body: some View {
        TabView {
            MaravillasView()
            // Cuando los paremetros de una funcion tiene un
            // _, significa que ese parametro es opcional
            // Adiconalmente, lo que esta despues de ->
            // es lo que regresa la funcion
                .tabItem {
                    Image(systemName: "house.fill")
                }
            PerfilView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(nombre: "Christopher")
    }
}

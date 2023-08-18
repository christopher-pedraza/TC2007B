//
//  MainView.swift
//  App03
//
//  Created by Alumno on 18/08/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle.fill")
                }
            FoodView()
                .tabItem {
                    Label("Recetas", systemImage: "fork.knife.circle.fill")
                }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

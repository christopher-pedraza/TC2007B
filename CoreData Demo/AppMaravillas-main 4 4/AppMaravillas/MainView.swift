//
//  MainView.swift
//  AppMaravillas
//
//  Created by Elvia Rosas on 17/08/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var nombre : String = ""
    @StateObject var maravillasVM = MaravillasViewModel()
    
    var body: some View {
        TabView{
            MaravillasView(nombre: $nombre)
                .environmentObject(maravillasVM)
                .tabItem {
                    Image(systemName: "house.fill")
                }
            PerfilView(nombre: $nombre)
                .tabItem {
                    Image(systemName: "person.fill")
                }
            FavoritosView()
                .tabItem {
                    Image(systemName: "heart.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

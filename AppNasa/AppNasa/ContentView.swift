//
//  ContentView.swift
//  AppNasa
//
//  Created by Alumno on 14/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var PhotoVM = PhotoViewModel()
    
    var body: some View {
        NavigationView {
            // Para cada uno de los elementos dentro del
            // del arreglo, lo guardamos en item
            List(PhotoVM.arrPhoto) { item in
                VStack {
                    Text(item.title)
                    // Con async image podemos ir descargando las imagenes
                    // mientras las vamos necesitamos aunque no las tengamos
                    // en assets
                    AsyncImage(url: URL(string: item.url))
                        .scaledToFit()
                        .frame(height: 150)
                        .clipped()
                }
            }
            .task {
                do {
                    try await PhotoVM.getPhotosData()
                } catch {
                    print("Error")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

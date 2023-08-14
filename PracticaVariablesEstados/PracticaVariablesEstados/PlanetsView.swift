//
//  PlanetView.swift
//  PracticaVariablesEstados
//
//  Created by Alumno on 14/08/23.
//

import SwiftUI

struct PlanetsView: View {
    @StateObject private var model = PlanetsViewModel()
    
    var body: some View {
        ScrollView {
            VStack (spacing: 16) {
                if model.isLoading && model.planets.isEmpty {
                    ProgressView()
                }
                else {
                    
                    ForEach(model.planets) { planet in
                        NavigationLink(value: planet) {
                            HStack (spacing: 32) {
                                Image(planet.name)
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(height: 120)
                                Text(planet.name)
                                    .font(.title.bold())
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            } // HStack
                            .padding()
                            .background(Material.regular, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                        }
                        .buttonStyle(.plain)
                    }
                }
            } // VStack
            .padding()
            
        } // ScrollView
        .navigationTitle("Planetas")
        // Con Planet.self pasamos el tipo planeta, no un objeto en si
        .navigationDestination(for: Planet.self) { planet in
            PlanetView(planet: planet)
        }
        // OnAppear ejecuta una funcion cuando se cargue la vista
        .onAppear(perform: downloadPlanets)
    }
    
    // La funcion va a terminar, pero lo que tengamos dentro de la Task puede seguir
    // esperando. Esto es para funciones asincronas
    func downloadPlanets() {
        Task {
            do {
                try await model.downloadPlanets()
            } catch {
            }
        }
    }
    
}

struct PlanetsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlanetsView()
        }
    }
}

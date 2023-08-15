//
//  PlanetsViewModel.swift
//  PracticaVariablesEstados
//
//  Created by Alumno on 14/08/23.
//

import Foundation
import Combine // Para los estados

// Utilizamos un ViewModel porque los structs se destruyen cada vez que se actualizan
// por esto, no podemos guardar cosas alli. Para eso usamos clases en el ViewModel

// ObservableObject para que SwiftUI sepa que es para un estado
class PlanetsViewModel : ObservableObject {
    // El @Published lo que hace es que cuando es modificado, manda al constructor de la
    // clase del view a que se vuelva a construir
    @Published var isLoading = false
    @Published var planets = planetList
    
    func downloadPlanets() async throws {
        isLoading = true
        do {
            /*
            // Real request
             let url = URL(string: "")
             let urlRequest = URLRequest(url: url)
             ...
            */
            // Simulate request
            try await Task.sleep(for: .seconds(2))
            
            isLoading = false
            planets = planetList
        } catch {
            isLoading = false
            print("PlanetsViewModel Error: ", error.localizedDescription)
            throw error
        }
    }
}

let planetList = [
    Planet(name: "Mercury", description: "First planet of the solar system."),
    Planet(name: "Venus", description: "Second planet of the solar system."),
    Planet(name: "Earth", description: "Third planet of the solar system."),
    Planet(name: "Mars", description: "Fourth planet of the solar system."),
]

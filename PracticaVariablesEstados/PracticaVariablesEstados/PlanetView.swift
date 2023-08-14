//
//  PlanetView.swift
//  PracticaVariablesEstados
//
//  Created by Alumno on 14/08/23.
//

import SwiftUI

struct PlanetView: View {
    let planet: Planet
    
    @ObservedObject private var model = PlanetsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                Image(planet.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400)
                    .padding(.horizontal, 32)
                VStack(spacing: 12) {
                    Text(planet.name)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    Text(planet.description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(32)
        }
        .navigationTitle(planet.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(planet: planetList[0])
    }
}

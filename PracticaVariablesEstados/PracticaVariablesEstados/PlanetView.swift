//
//  PlanetView.swift
//  PracticaVariablesEstados
//
//  Created by Alumno on 14/08/23.
//

import SwiftUI

struct PlanetView: View {
    @EnvironmentObject private var alertModel: AlertControllerModel
    
    let planet: Planet
    @ObservedObject var model = PlanetsViewModel()
    
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
                Button("Show Alert", action: showAlert)
            }
            .padding(32)
        }
        .navigationTitle(planet.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func showAlert() {
        alertModel.addAlert(.message(t: planet.name, m: planet.description))
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        AlertController {
            PlanetView(planet: planetList[0], model: .init())
        }
    }
}

//
//  LocationView.swift
//  Primera
//
//  Created by Alumno on 10/08/23.
//

import SwiftUI

struct MaravillasItemView: View {
    let titulo: String
    
    var body: some View {
        /*
        VStack {
            Image("ChichenItza")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(height: 100)
            Text("ChichenItza")
        }
        
        VStack {
            Image("ChichenItza")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .cornerRadius(30)
                .padding()
            Text("Adios")
        }
         */
        
        VStack {
            Image("ChichenItza")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(height: 75)
            Text(titulo)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        MaravillasItemView(titulo: "ChichenItza")
    }
}

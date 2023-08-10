//
//  ContentView.swift
//  Primera
//
//  Created by Alumno on 10/08/23.
//

import SwiftUI

struct ContentView: View {
    let arrMaravillas = ["ChichenItza", "TajMajal", "Coliseo"]
    
    var body: some View {
        // ZStack permite apilar vistas, en este caso
        // primero estamos poniendo el color, y luego
        // por encima, el texto
        ZStack {
            Color(.blue)
                .ignoresSafeArea()
            ScrollView(.horizontal) {
                HStack {
                    ForEach(arrMaravillas, id: \.self) { item in
                        MaravillasItemView(titulo: item)
                    }
                    
                    
                }.foregroundColor(.white)
                Spacer()
            } // Scrollview
        } // ZStack
    } // body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

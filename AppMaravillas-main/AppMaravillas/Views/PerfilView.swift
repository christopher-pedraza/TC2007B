//
//  PerfilView.swift
//  AppMaravillas
//
//  Created by Alumno on 17/08/23.
//

import SwiftUI

struct PerfilView: View {
    @State var nombre : String = ""
    
    var body: some View {
        Form {
            // El simbolo de $ significa que es un binding
            // y para que se identifique como binding, necesitas
            // declararla como @state
            TextField("Nombre", text: $nombre)
            Text("Hola \(nombre)")
        }
    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView()
    }
}

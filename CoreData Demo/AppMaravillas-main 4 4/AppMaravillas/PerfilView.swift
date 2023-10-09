//
//  PerfilView.swift
//  AppMaravillas
//
//  Created by Elvia Rosas on 17/08/23.
//

import SwiftUI

struct PerfilView: View {
    
    @Binding var nombre : String
    
    var body: some View {
        Form{
            
            TextField("Nombre", text: $nombre)
            
            Text("Hola \(nombre)")
        }
    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView(nombre: .constant("Elvia"))
    }
}

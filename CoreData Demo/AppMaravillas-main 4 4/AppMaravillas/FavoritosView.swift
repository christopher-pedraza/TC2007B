//
//  FavoritosView.swift
//  AppMaravillas
//
//  Created by Alumno on 09/10/23.
//

import SwiftUI

struct FavoritosView: View {
    @FetchRequest(sortDescriptors: []) var maravillasFav : FetchedResults<Maravilla>
    var body: some View {
        List(maravillasFav) { maravilla in
            // Como maravilla.titulo es un valor string opcional (podria o no
            // tener datos), necesitamos hacerle un unwrap. Hay varias maneras
            // de hacerlo:
            // 1. Si confiamos que si va a tener los datos que necesitamos podemos
            // usar "!", por ejemplo, "maravilla.titulo!". En este caso si no
            // llegara a haber el dato, la aplicacion fallaria, pero si estamos
            // seguros que no va a pasar, no va a haber problemas
            // 2. Usar "??" como valor por defecto en caso de que no haya el
            // dato.
            Text(maravilla.titulo ?? "Unknown")
        }
    }
}

struct FavoritosView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritosView()
    }
}

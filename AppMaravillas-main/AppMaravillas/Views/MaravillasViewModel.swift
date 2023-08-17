//
//  MaravillasViewModel.swift
//  AppMaravillas
//
//  Created by Elvia Rosas on 23/09/22.
//

import Foundation
import SwiftUI

class MaravillasViewModel : ObservableObject {
    
    @Published var arrMaravillas = [MaravillasModel]()
    
    init(){
        getMaravillas()
    }
    
    
    func getMaravillas() {
        
        var maravilla : MaravillasModel
        
        
        maravilla = MaravillasModel(titulo: "Chichen Itza", descripcion: "El Templo Kukulcán es la construcción más conocida de Chichen Itzá, el sitio arqueológico maya que se encuentra en el norte de la península de Yucatán.", urlVideo: "https://www.youtube.com/watch?v=sO7U78pUr34", latitud: 20.6666700, longitud: -88.5666700, nombreImagen: "ChichenItza")
        arrMaravillas.append(maravilla)
        
        maravilla = MaravillasModel(titulo: "Taj Mahal ", descripcion: "En su lecho de muerte, la esposa favorita del rey Shah Jhan, le pidió que le construyera un monumento único en el mundo. En la construcción del Taj Mahal participaron 20 mil obreros. ", urlVideo: "https://www.youtube.com/watch?v=Vu8kO9qxG4o", latitud: 18.9216900, longitud:  72.8331200, nombreImagen: "TajMahal")
        arrMaravillas.append(maravilla)
        
        maravilla = MaravillasModel(titulo: "Coliseo Romano ", descripcion: "La construcción del Coliseo inició en el 71 d.C., y su propósito era albergar juegos de gladiadores, batallas navales y lucha con animales.", urlVideo: "https://www.youtube.com/watch?v=pJOwI-74xwY", latitud: 44.4168600, longitud:  12.2100000, nombreImagen: "Coliseo")
        arrMaravillas.append(maravilla)
        
    }
    
}

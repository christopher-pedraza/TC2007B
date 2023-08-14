//
//  PhotoViewModel.swift
//  AppNasa
//
//  Created by Alumno on 14/08/23.
//

import Foundation
import SwiftUI

// Con esto vamos a hacer nuestro arreglo de modelos de fotos. Vamos a leer el JSON y crear el arreglo
// Para poder poner publico nuestro arreglo, ponemos lo de ObservableObject y Published
class PhotoViewModel : ObservableObject {
    // Con [PhotoModel]() creamos un arreglo vacio de PhotoModels
    @Published var arrPhoto = [PhotoModel]()
    
    // Como vamos a hacer un request, queremos que nuestra funcion se espere en lo que recibe los datos
    // Para esto, hacemos que la funcion sea async
    func getPhotosData() async {
        // urlrequest prepara para hacer un request
        // urlsession ya hace el request
        // jsondecoder decodifica el json que obtuvimos
        
        // Guard es como un trycase, si se logra crear la variable url continua, sino, muestra error
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&count=10")
            else {
                // Si no lo logra, muestra error y sale de la funcion
                print("Invalid URL")
                return
            }
        
        // Se prepara para hacer la llamada
        // Le podemos agregar mas parametros a este request sobre que tipo estamos pidiendo, etc.
        let urlRequest = URLRequest(url: url)
        
        // Agregamops el try para manejar errores y el await para que el programa se espere a recibir la respuesta
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        // Video 28:57
        
    }
}

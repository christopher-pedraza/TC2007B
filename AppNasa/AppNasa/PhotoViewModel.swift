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
    // Adicionalmente, para manejar los errores del try, ponemos throws
    func getPhotosData() async throws {
        // urlrequest prepara para hacer un request
        // urlsession ya hace el request
        // jsondecoder decodifica el json que obtuvimos
        
        // Guard es como un trycase, si se logra crear la variable url continua, sino, muestra error
        // Obtener el objeto URL
        // guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&count=10")
        guard let url = URL(string: "https://www.freetogame.com/api/games?platform=browser&category=shooter&sort-by=release-date")
            else {
                // Si no lo logra, muestra error y sale de la funcion
                print("Error - PhotoViewModel: Invalid URL")
                return
            }
        
        // Se prepara para hacer la llamada
        // Le podemos agregar mas parametros a este request sobre que tipo estamos pidiendo, etc.
        let urlRequest = URLRequest(url: url)
        
        // Agregamops el try para manejar errores y el await para que el programa se espere a recibir la respuesta
        // Realizamos la llamada al urlRequest obteniendo datos
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        // Checar si se obtuvo una respuesta o no
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("Error - PhotoViewModel: HTTP Request Failed")
            return
        }
        
        // Hacemos un decode del JSON en un arreglo de PhotoModel de data
        // Decodificar la informacion de formato JSON
        let results = try JSONDecoder().decode([PhotoModel].self, from: data)
        
        // Llenamos el arreglo que es publico con los datos del JSON
        // Para no ejecutarlo en el background sino en el thread principal
        // Utilizamos el thread principal para actualizar la variable arrPhoto
        DispatchQueue.main.async {
            // Usamos el self para referirnos que buscamos dentro de esta clase
            self.arrPhoto = results
        }
    }
}

//
//  ContentView.swift
//  PetClassifier
//
//  Created by Alumno on 04/09/23.
//

import SwiftUI
import CoreML
import Vision
import PhotosUI

struct ContentView: View {
    @State private var selectedImage: UIImage?
    @State private var classificationResults: [VNClassificationObservation] = []
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    var body: some View {
        VStack {
            // If let te deja checar si un objeto es nulo, si no lo es
            // lo asigno a una constante
            // Si avatarImage es diferente a nulo, se le asigna algo
            // IMPORTANTE: esto NO es lo mismo al estado de arriba
            if let avatarImage {
                avatarImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            
            // Con photopicker no necesitas dar permiso a la galeria
            // porque la app solo va a obtener la imagen que tu
            // selecciones. La mayoria de las apps no usan esto
            // Cuando selecciona un recurso, lo que nos regresa es un PhotoPickerItem
            // esto luego lo vamos a convertir a una imagen
            PhotosPicker("Select Image", selection: $avatarItem, matching: .images)
            
            Button("Classify") {
                // Si quisiera usar el mismo nombre que el estado
                // podria solo poner if let selectedImage {...},
                // pero esta es otra manera de hacerlo
                if let image = selectedImage {
                    classifyImage(image)
                }
            }
            
            List(classificationResults, id: \.identifier) { result in
                Text("\(result.identifier): \(result.confidence)")
            }
        } // VStack
        .onChange(of: avatarItem) { _ in
            Task {
                // Si se puede convertir el PhotoPickerImage a datos, entra
                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                    // Si se puede convertir los datos a una imagen entra
                    // SwiftUI usa Image, pero el PhotoPicker regresa un PickerImage
                    // y para Vision se necesita un UIImage
                    if let uiImage = UIImage(data: data) {
                        selectedImage = uiImage
                        avatarImage = Image(uiImage: uiImage)
                        return
                    }
                }
            }
        } // .onChange
    } // body
    
    func classifyImage(_ image: UIImage) {
        // Tenemos el modelo que importamos, ahora hay que alimentarlo a Vision para
        // que lo procese
        if let model = try? VNCoreMLModel(for: PetClassifier(configuration: MLModelConfiguration()).model) {
            // Create Request
            let request = VNCoreMLRequest(model: model) { request, error in
                if let results = request.results as? [VNClassificationObservation] {
                    classificationResults = results
                }
            }
            
            // Perform Request
            // Le podemos bajar la calidad a las imagenes por si acaso procesamos
            // muchas
            if let imageData = image.jpegData(compressionQuality: 1.0) {
                let handler = VNImageRequestHandler(data: imageData, options: [:])
                try? handler.perform([request])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  DemoApp
//
//  Created by Alumno on 05/10/23.
//

import SwiftUI
import RealityKit

struct AstronautaView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

// UIViewRepresentable es para poner vistas de UIKit en
// swiftui
struct ARViewContainer: UIViewRepresentable {
    // El ARView es una vista de reality kit
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Para poder determinar donde poner el ARView
        // a la escena de la vista le agrega un anchor
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct AstronautaView_Previews : PreviewProvider {
    static var previews: some View {
        AstronautaView()
    }
}
#endif

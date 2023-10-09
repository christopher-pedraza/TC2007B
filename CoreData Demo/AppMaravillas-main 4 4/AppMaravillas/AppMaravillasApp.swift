//
//  AppMaravillasApp.swift
//  AppMaravillas
//
//  Created by Elvia Rosas on 21/09/22.
//

import SwiftUI

@main
struct AppMaravillasApp: App {
    // Inicializamos el objeto controlador de CoreData
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            MainView()
                // Inyectamos el context del objeto con environment para que
                // lo podamos acceder desde todos los archivos
                // Del objeto que es un PersistentContainer, mandamos el Context
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

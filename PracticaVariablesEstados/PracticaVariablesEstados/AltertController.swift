//
//  AltertController.swift
//  PracticaVariablesEstados
//
//  Created by Alumno on 15/08/23.
//

import SwiftUI

struct AlertController <Content: View>: View {
    @StateObject private var model = AlertControllerModel()
    
    let content: () -> Content
    
    var body: some View {
        content()
            .environmentObject(model)
            .alert(
                model.alerts.first?.title ?? "",
                isPresented: model.isAlertPresented,
                presenting: model.alerts.first,
                actions: { _ in
                    Button("OK", role: .cancel, action: didHideAlert)
                },
                message: { item in
                    switch item {
                    case .error(let e):
                        Text(e.localizedDescription)
                    case .message(_, let m):
                        Text(m)
                    }
                }
            )
    }
    
    func didHideAlert() {
        model.alerts.remove(at: 0)
    }
}
    
import Combine
    
class AlertControllerModel: ObservableObject {
    @Published fileprivate var alerts = [Item]()
    
    fileprivate var isAlertPresented: Binding<Bool> {
        Binding<Bool>(
            get: { !self.alerts.isEmpty },
            set: { _ in }
        )
    }
    
    func addAlert(_ alert: Item) {
        alerts.append(alert)
    }
    
    enum Item {
        case error(e: Error)
        case message(t: String, m: String)
        
        var title: String {
            switch self {
            case .error:
                return "Error"
            case .message(let t, _):
                return t
            }
        }
    }
}

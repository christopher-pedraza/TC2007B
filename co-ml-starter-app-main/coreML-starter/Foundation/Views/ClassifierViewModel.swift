//
//  ClassifierViewModel.swift
//  coreML-starter
//
//  
//

import Foundation

final class ClassifierViewModel: ObservableObject {
    @Published var classifierData: [Classification] = []
    @Published var dataWhenAboutTapped:Int = 0
    
    func loadJSON() {
        print("load JSON")
        if let url = Bundle.main.url(forResource: "mydata", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                classifierData = try decoder.decode([Classification].self, from: jsonData)
            } catch {
                print(error)
            }
        } else {
            print("could not find data")
        }
    }
    
    func getPredictionData(label: String) -> Classification {        
        return classifierData.filter { $0.label == label }.first ?? Classification()
    }
}

//
//  PhotoModel.swift
//  AppNasa
//
//  Created by Alumno on 14/08/23.
//

import Foundation

// Para poder decodificar un JSON, ponemos decodable. Tambien existe
// codable para crear JSONs
struct PhotoModel : Decodable, Identifiable {
    // Si es identifiable necesita un id
    var id = UUID()
    var title : String
    var explanation : String
    var url : String
    
    // Con esto decimos que vamos hacer el match de nuestras variables con las que
    // vienen del JSON
    enum CodingKeys : String, CodingKey {
        case title
        case explanation = "short_description"
        // por ejemplo, si en nuestras variables tuvieran en vez de explanation
        // description, aqui pondriamos 'case description = "explanation"' para
        // decir que nuestra variable va a tomar ese valor del JSON. Si no tengo
        // cambios lo pongo igual
        case url = "thumbnail"
    }
    
}

extension PhotoModel {
    public static var defaultPhoto = PhotoModel(title: "Starbreak", explanation: "A Roguelike MMORPG with MetroidVania-style platformer.", url: "https://www.freetogame.com/g/118/thumbnail.jpg")
}

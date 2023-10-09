//
//  MaravillaDetailView.swift
//  AppMaravillas
//
//  Created by Elvia Rosas on 21/09/22.
//

import SwiftUI

struct MaravillaDetailView: View {
    
    @EnvironmentObject var maravillasVM : MaravillasViewModel
    @Environment(\.managedObjectContext) var moc
    
    let maravilla : MaravillasModel
    
    var body: some View {
        
        VStack{

            Image(maravilla.nombreImagen)
                .resizable()
                .scaledToFit()
                .frame(width:250)
                .clipShape(Circle())
                .shadow(radius: 7)
                .offset(y:-50)
            VStack{
                Text(maravilla.titulo)
                    .font(Font.custom("Andale Mono", size: 18))
                    .foregroundColor(.blue)
                    .offset(y:-20)
                
                Image(systemName: maravilla.isFavorite ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    // Cuando le demos tap a la estrella, vamos a guardar en
                    // ManagedObjectContext
                    .onTapGesture {
                        maravillasVM.arrMaravillas[maravillasVM.arrMaravillas.firstIndex(of: maravilla) ?? 0].isFavorite.toggle()
                        
                        // Estamos creando una entity del MaravillasModel
                        // (el de CoreData, no el del JSON)
                        let maravillaFav = Maravilla(context: moc)
                        maravillaFav.id = maravilla.id
                        maravillaFav.descripcion = maravilla.descripcion
                        maravillaFav.isFavorite = maravilla.isFavorite
                        maravillaFav.latitud = maravilla.latitud
                        maravillaFav.longitud = maravilla.longitud
                        maravillaFav.nombreImagen = maravilla.nombreImagen
                        maravillaFav.urlVideo = maravilla.urlVideo
                        maravillaFav.titulo = maravilla.titulo
                        
                        try? moc.save()
                        
                    }
                
                
                Text(maravilla.descripcion)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Link(destination: URL(string: maravilla.urlVideo)!, label: {
                    Label("Video", systemImage: "play.tv.fill")
                })
                Spacer()
            }
        }
        
    }
}

struct MaravillaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MaravillaDetailView(maravilla : MaravillasModel.defaultMaravilla)
    }
}

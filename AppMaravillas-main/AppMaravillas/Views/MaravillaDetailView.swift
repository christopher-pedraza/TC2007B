//
//  MaravillaDetailView.swift
//  AppMaravillas
//
//  Created by Elvia Rosas on 21/09/22.
//

import SwiftUI

struct MaravillaDetailView: View {
    
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
                    .font(Font.custom("Bradley Hand Bold", size: 38))
                    .foregroundColor(.blue)
                    .offset(y:-20)
                
                Text(maravilla.descripcion)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Link(destination: URL(string: maravilla.urlVideo)!, label: {
                    Label("Video", systemImage: "play.tv.fill")
                })
            }
        }
        
    }
}

struct MaravillaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MaravillaDetailView(maravilla : MaravillasModel.defaultMaravilla)
    }
}

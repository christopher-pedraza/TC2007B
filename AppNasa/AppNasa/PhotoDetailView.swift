//
//  PhotoDetailView.swift
//  AppNasa
//
//  Created by Alumno on 14/08/23.
//

import SwiftUI

struct PhotoDetailView: View {
    let photo : PhotoModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: photo.url))
                .scaledToFit()
                .frame(width: 300)
                .clipShape(Circle())
                .shadow(radius: 7)
                .offset(y: -80)
            
            Text(photo.title)
                .font(.title)
                .bold()
                .foregroundColor(.cyan)
                .offset(y: -55)
            
            Text(photo.explanation)
                .multilineTextAlignment(.center)
                .padding()
                .offset(y: -25)
        }
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(photo: PhotoModel.defaultPhoto)
    }
}

//
//  ProfileView.swift
//  App03
//
//  Created by Alumno on 18/08/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        GeometryReader { proxy in
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .position(x: proxy.size.width/2, y: proxy.size.height/2)
                .offset(y: -100)
                .foregroundColor(.cyan)
            Text("Christopher Pedraza")
                .position(x: proxy.size.width/2, y: proxy.size.height/2)
                .offset(y: 100)
                .font(.title)
            Link("Github", destination: URL(string: "https://github.com/christopher-pedraza/")!)
                .position(x: proxy.size.width/2, y: proxy.size.height*3/4)
                .font(.title)
        }
        .frame(width: 300)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

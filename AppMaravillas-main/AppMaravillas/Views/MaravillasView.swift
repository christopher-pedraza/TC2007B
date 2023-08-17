//
//  ContentView.swift
//  AppMaravillas
//
//  Created by Elvia Rosas on 21/09/22.
//

import SwiftUI

struct MaravillasView: View {
    
    @StateObject var maravillasVM = MaravillasViewModel()
    
    var body: some View {
            NavigationView{
                ZStack{
                    Color(.white)
                        .edgesIgnoringSafeArea(.all)
                    ScrollView(.vertical, showsIndicators: false){
                        VStack{
                            ForEach(maravillasVM.arrMaravillas) { item in
                                NavigationLink(destination: MaravillaDetailView(maravilla: item),
                                label: { MaravillaItemView(maravilla: item)})
                                
                            } //Foreach
                        } //VStack
                    }//ScrollView
                }//ZStack
                .navigationTitle("Las Maravillas")
            } //Navigation View
             
            


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MaravillasView()
    }
}

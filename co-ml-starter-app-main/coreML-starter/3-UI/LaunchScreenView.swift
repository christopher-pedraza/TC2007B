//
//  LaunchScreenView.swift
//  coreML-starter
//
//  
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            VStack {
                // header image:
                // TODO: replace with your own image.  Drag an image from your computer to assets.xcassets and add the name of your image below
                Image("water-footprint")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                // image from: https://www.pngitem.com/middle/ioRbwwh_what-is-water-footprint-safe-water-save-life/
                
                // title
                // TODO: Replace app title
                Text("Water Footprint")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.blue)
                
                Divider().frame(maxWidth: 300)
                
                // info
                // TODO: Replace with description of your app
                VStack(spacing: 20) {
                    Text("Descubre cuánta agua se necesita para crecer nuestra comida")
                    
                    Text("Reconoce las siguientes frutas: ")
                }
                .padding()
                .multilineTextAlignment(.center)
                
                VStack {
                    
                    HStack(spacing: 10) {
                        VStack {
                            Text("🍎")
                            Text("Apple")
                        }
                        .padding()
                        
                        VStack {
                            Text("🥑")
                            Text("Avocado")
                        }
                        .padding()
                        
                        VStack {
                            Text("🍌")
                            Text("Banana")
                        }
                        .padding()
                        
                        VStack {
                            Text("🍊")
                            Text("Grapefruit")
                        }
                        .padding()
                    }
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    
                    HStack(spacing: 10) {
                        VStack {
                            Text("🍇")
                            Text("Grapes")
                        }
                        .padding()
                        
                        VStack {
                            Text("🍈")
                            Text("Guava")
                        }
                        .padding()
                        
                        VStack {
                            Text("🍋")
                            Text("Lemon")
                        }
                        .padding()
                        
                        VStack {
                            Text("🍊")
                            Text("Orange")
                        }
                        .padding()
                    }
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    
                    HStack(spacing: 10) {
                        VStack {
                            Text("🍐")
                            Text("Pear")
                        }
                        .padding()
                        
                        VStack {
                            Text("🍅")
                            Text("Tomato")
                        }
                        .padding()
                        
                        VStack {
                            Text("🍉")
                            Text("Watermelon")
                        }
                        .padding()
                    }
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                }
                
                // start button
                NavigationLink(destination: ClassificationView()){
                    Text("Start")
                }
                .buttonStyle(RoundedRectButtonStyle(buttonColor: .blue))
                .padding()
                
                // about page
                NavigationLink(destination: AboutView()){
                    Text("Credits")
                }
            }
            .padding()
            .frame(maxWidth: 500)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(radius: 5)
            
        }// VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: 0xD5F4FF, opacity: 1.0))
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            if #available(iOS 15.0, *) {
                LaunchScreenView()
                    .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
                    .previewInterfaceOrientation(.landscapeLeft)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

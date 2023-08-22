//
//  PredictionResultView.swift
//  coreML-starter
//

import SwiftUI

struct PredictionResultView: View {
    private(set) var labelData: Classification
    
    var body: some View {
        // TODO: The View that shows classification results - edit the styling below!
        
        VStack(alignment: .center) {
            Text(labelData.label.capitalized)
                .font(.largeTitle)
            
            Text(labelData.emoji)
                .font(.system(size: 100))
                .padding(.bottom, 5)
            
            HStack(alignment: .center, spacing: 1) {
                if(labelData.water > 0) {
                    ForEach(0...labelData.water-1, id: \.self) { index in
                        Text("💧")
                    }
                }
            }
            
            HStack {
                Text(labelData.water.description)
                if (labelData.water > 1) {
                    Text("gallons")
                } else {
                    Text("gallon")
                }
            }
            .padding(15)
            
        }// VStack
        .frame(width: 400)
        .padding()
    }
}

struct PredictionResultView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionResultView(labelData: Classification())
    }
}

#  CoreML Sample App
An starter app that takes a CoreML (.mlmodel) file and can display live classification results from camera input. 

## Instructions
1. Import model & point to model class
* Export the model from Co-ML and download the .mlmodel file to your computer
* Drag the .mlmodel file into the starter app (under the `1-Model` folder)
* In `PredictionStatus,` set `modelObject` to the name or your model.  For example, a model named `Produce.mlmodel` would be `var modelObject = Produce()`

2. Edit Data (JSON & Swift)
* Decide what type of information you want to appear in the app for each label.  See `2-Data > mydata.json` as an example.
* Edit `2-Data > mydata.json` with the labels in your classifier and any associated data you want to appear (e.g., replace “water” or “emoji” with your custom content)
* in `2-Data > Classification.swift`, edit based on the format of the data in your JSON file (change names of keys, provide type for value, and provide default values)


2. Edit UI 
* Classification UI: Edit `3-UI > PredictionResultView.swift` based on the content you want to appear when the classifier identifies an object.  You can view a preview of the UI if you open up Canvas in XCode (it will show the default values you added in `Classification.swift`)
* Launch screen: `3-UI > LaunchScreenView.swift` to customize the launch screen contents

## Extra Credit: Add an About page 
* Edit `3-UI > AboutView.swift` to share details about who created the app 



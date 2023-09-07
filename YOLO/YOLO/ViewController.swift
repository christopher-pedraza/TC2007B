import CoreMedia
import CoreML
import UIKit
import Vision

class ViewController: UIViewController {
    
    @IBOutlet var videoPreview: UIView!
    var videoCapture: VideoCapture!
    var currentBuffer: CVPixelBuffer?
    
    lazy var visionModel: VNCoreMLModel = {
        // Metemos el codigo en un do...catch porque estamos llamando
        // funciones que podrian fallar con try
        do {
            let coreMLWrapper = try ObjectDetector(configuration: MLModelConfiguration())
            let visionModel = try VNCoreMLModel(for: coreMLWrapper.model)
            
            // Si estuvieramos trabajando con un modelo de CreateML, ya no
            // ocupariamos mas, pero con el YOLO necesitamos configurar
            // unos parametros
            visionModel.inputImageFeatureName = "image"
            // Como recibe 3 inputs el modelo...
            visionModel.featureProvider = try MLDictionaryFeatureProvider(dictionary: [
                "iouThreshold": MLFeatureValue(double: 0.45),
                "confidenceThreshold": MLFeatureValue(double: 0.25),
            ])
            return visionModel
        }
        catch {
            fatalError("Error creating the visionModel")
        }
    }()
    
    // Este codigo se va a llamar siempre que encuentre un resultado
    lazy var visionRequest: VNCoreMLRequest = {
        let request = VNCoreMLRequest(model: visionModel, completionHandler: { [weak self] request, error in
            self?.processObservations(for: request, error: error)
        })
        
        request.imageCropAndScaleOption = .scaleFit
        return request
    }()
    
    // Los limitamos a 10 para no sobrecargar la memoria
    let maxBoundingBoxViews = 10
    var boundingBoxViews = [BoundingBoxView]()
    var colors: [String: UIColor] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBoundingBoxViews()
        setUpCamera()
    }
    
    func setUpBoundingBoxViews() {
        for _ in 0..<maxBoundingBoxViews {
            boundingBoxViews.append(BoundingBoxView())
        }
    }
    
    func setUpCamera() {
        videoCapture = VideoCapture()
        videoCapture.delegate = self
        
        videoCapture.frameInterval = 1
        
        videoCapture.setUp(sessionPreset: .hd1280x720) { success in
            if success {
                // Add the video preview into the UI.
                if let previewLayer = self.videoCapture.previewLayer {
                    self.videoPreview.layer.addSublayer(previewLayer)
                    self.resizePreviewLayer()
                }
                
                // Add the bounding box layers to the UI, on top of the video preview.
                for box in self.boundingBoxViews {
                    box.addToLayer(self.videoPreview.layer)
                }
                
                // Once everything is set up, we can start capturing live video.
                self.videoCapture.start()
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        resizePreviewLayer()
    }
    
    func resizePreviewLayer() {
        videoCapture.previewLayer?.frame = videoPreview.bounds
    }
    
    // Ya hicimos el request, pero ahora hay que ejecutar el request
    func predict(sampleBuffer: CMSampleBuffer) {
        // El buffer que recibimos no es la imagen en si, necesitamos
        // sacarla, que es el pixelBuffer
        if currentBuffer == nil, let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) {
            currentBuffer = pixelBuffer
            
            var options: [VNImageOption : Any] = [:]
            if let cameraIntrinsicMatrix = CMGetAttachment(sampleBuffer, key: kCMSampleBufferAttachmentKey_CameraIntrinsicMatrix, attachmentModeOut: nil) {
                options[.cameraIntrinsics] = cameraIntrinsicMatrix
            }
            
            let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: options)
            do {
                try handler.perform([self.visionRequest])
            } catch {
                print("Failed to per form Vision request: \(error)")
            }
            // Se limpia el buffer al final de hacer la prediccio
            currentBuffer = nil
        }
    }
    
    func processObservations(for request: VNRequest, error: Error?) {
        // Siempre que vea un warning morado, es porque estamos haciendo
        // una operacion en el main thread. Especialmente si se podria
        // trabar el proceso, NO debemos trabar el main thread
        DispatchQueue.main.async {
            // Siempre que Vision encuentre un resultado, lo va a procesar
            // con la funcion show
            if let results = request.results as? [VNRecognizedObjectObservation] {
                self.show(predictions: results)
            } else {
                self.show(predictions: [])
            }
        }
    }
    
    // Dibuja en la pantalla el recuadro que dice que objeto es
    func show(predictions: [VNRecognizedObjectObservation]) {
        for i in 0..<boundingBoxViews.count {
            if i < predictions.count {
                let prediction = predictions[i]
                
                
                let width = view.bounds.width
                let height = width * 16 / 9
                let offsetY = (view.bounds.height - height) / 2
                let scale = CGAffineTransform.identity.scaledBy(x: width, y: height)
                // Se necesita transformar ya que la imagen que usa
                // el modelo es distinta a la imagen de tu camara
                let transform = CGAffineTransform(scaleX: 1, y: -1).translatedBy(x: 0, y: -height - offsetY)
                let rect = prediction.boundingBox.applying(scale).applying(transform)
                
                // Un objeto podria ser identificado multiples ocasiones
                // en caso de que cubra multiples cuadros en los que
                // se dividio la imagen. La posicion 0 de lables es la
                // que tiene mayor porcentaje de confidence
                let bestClass = prediction.labels[0].identifier
                let confidence = prediction.labels[0].confidence
                
                // Show the bounding box.
                let label = String(format: "%@ %.1f", bestClass, confidence * 100)
                boundingBoxViews[i].show(frame: rect, label: label, color: UIColor.red)
            } else {
                boundingBoxViews[i].hide()
            }
        }
    }
}

extension ViewController: VideoCaptureDelegate {
    func videoCapture(_ capture: VideoCapture, didCaptureVideoFrame sampleBuffer: CMSampleBuffer) {
        predict(sampleBuffer: sampleBuffer)
    }
}

import UIKit

// Muy importante por si volteamos la camara y el modelo no esta
// entreando con los objetos volteados.
// Entonces con esto se pasan las imagenes volteadas si se voltea
// la camara
extension CGImagePropertyOrientation {
  init(_ orientation: UIImage.Orientation) {
    switch orientation {
    case .upMirrored: self = .upMirrored
    case .down: self = .down
    case .downMirrored: self = .downMirrored
    case .left: self = .left
    case .leftMirrored: self = .leftMirrored
    case .right: self = .right
    case .rightMirrored: self = .rightMirrored
    default: self = .up
    }
  }
}

extension CGImagePropertyOrientation {
  init(_ orientation: UIDeviceOrientation) {
    switch orientation {
    case .portraitUpsideDown: self = .left
    case .landscapeLeft: self = .up
    case .landscapeRight: self = .down
    default: self = .right
    }
  }
}

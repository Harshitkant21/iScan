import Foundation
import SwiftUI
import VisionKit
import AVFoundation

//struct DataScannerView: UIViewControllerRepresentable {
//    
//    @Binding var recognizedItems: [RecognizedItem]
//    @Binding var showAlert: Bool
//    @Binding var navigateToProfileView: Bool // Add this binding
//    let recognizedDataType: DataScannerViewController.RecognizedDataType
//    let recognizesMultipleItems: Bool
//    
//    func makeUIViewController(context: Context) -> DataScannerViewController {
//        let vc = DataScannerViewController(
//            recognizedDataTypes: [recognizedDataType],
//            qualityLevel: .balanced,
//            recognizesMultipleItems: recognizesMultipleItems,
//            isGuidanceEnabled: true,
//            isHighlightingEnabled: true
//        )
//        vc.delegate = context.coordinator
//        return vc
//    }
//    
//    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
//        try? uiViewController.startScanning()
//    }
////    
////    func makeCoordinator() -> Coordinator {
////        Coordinator(recognizedItems: $recognizedItems, showAlert: $showAlert)
////    }
////    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(recognizedItems: $recognizedItems, showAlert: $showAlert, navigateToProfileView: $navigateToProfileView)
//    }
//
//    static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: Coordinator) {
//        uiViewController.stopScanning()
//    }
//    
//    class Coordinator: NSObject, DataScannerViewControllerDelegate {
//        
//        @Binding var recognizedItems: [RecognizedItem]
//        @Binding var showAlert: Bool
//        @Binding var navigateToProfileView: Bool // Initialize navigateToProfileView
//        
//        init(recognizedItems: Binding<[RecognizedItem]>, showAlert: Binding<Bool>, navigateToProfileView: Binding<Bool>) {
//            self._recognizedItems = recognizedItems
//            self._showAlert = showAlert
//            self._navigateToProfileView = navigateToProfileView // Initialize navigateToProfileView
//            super.init() // Call super.init() after initializing all properties
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
//            print("didTapOn \(item)")
//        }
//    
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            UINotificationFeedbackGenerator().notificationOccurred(.success)
//            recognizedItems.append(contentsOf: addedItems)
//            // Check if any of the added items contain the name of any ingredient
//            for item in addedItems {
//                switch item {
//                case .text(let text):
//                    for ingredient in ingredients {
//                        if text.transcript.lowercased().contains(ingredient.name) {
//                            DispatchQueue.main.async {
////                                self.showAlert = true
//                                self.navigateToProfileView = true
//                            }
//                            break
//                        }
//                    }
//                default:
//                    break
//                }
//            }
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didRemove removedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            self.recognizedItems = recognizedItems.filter { item in
//                !removedItems.contains(where: {$0.id == item.id })
//            }
//            print("didRemovedItems \(removedItems)")
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, becameUnavailableWithError error: DataScannerViewController.ScanningUnavailable) {
//            print("became unavailable with error \(error.localizedDescription)")
//        }
//        
//    }
//    
//}
//

struct DataScannerView: UIViewControllerRepresentable {
    @Binding var recognizedItems: [RecognizedItem]
    @Binding var showAlert: Bool
    @Binding var navigateToProfileView: Bool
    let recognizedDataType: DataScannerViewController.RecognizedDataType
    let recognizesMultipleItems: Bool

    func makeUIViewController(context: Context) -> DataScannerViewController {
        let vc = DataScannerViewController(
            recognizedDataTypes: [recognizedDataType],
            qualityLevel: .balanced,
            recognizesMultipleItems: recognizesMultipleItems,
            isGuidanceEnabled: true,
            isHighlightingEnabled: true
        )
        vc.delegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if navigateToProfileView {
            uiViewController.stopScanning()
        } else {
            try? uiViewController.startScanning()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(recognizedItems: $recognizedItems, showAlert: $showAlert, navigateToProfileView: $navigateToProfileView)
    }

    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        @Binding var recognizedItems: [RecognizedItem]
        @Binding var showAlert: Bool
        @Binding var navigateToProfileView: Bool
        var capturedImage: UIImage?

        init(recognizedItems: Binding<[RecognizedItem]>, showAlert: Binding<Bool>, navigateToProfileView: Binding<Bool>) {
            self._recognizedItems = recognizedItems
            self._showAlert = showAlert
            self._navigateToProfileView = navigateToProfileView
            super.init()
        }

        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            print("didTapOn \(item)")
        }

        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            recognizedItems.append(contentsOf: addedItems)
            for item in addedItems {
                switch item {
                case .text(let text):
                    for ingredient in ingredients {
                        if text.transcript.lowercased().contains(ingredient.name) {
                            DispatchQueue.main.async {
                                
                                let path =  FileManager.default.temporaryDirectory.appendingPathComponent("preview", conformingTo: .jpeg)
                                
                                if let screenshot = captureScreenshot(view: dataScanner.view) {
                                }
                                
                                self.navigateToProfileView = true
                            }
                            
                            break
                        }
                    }
                default:
                    break
                }
            }
            func captureScreenshot(view: UIView) -> UIImage? {
                
                class MyDelegate : NSObject, AVCapturePhotoCaptureDelegate {
                    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: (any Error)?) {
                        if let error = error {
                                       print(error.localizedDescription)
                                   }

                                   if let sampleBuffer = photoSampleBuffer, let previewBuffer = previewPhotoSampleBuffer, let dataImage = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: sampleBuffer, previewPhotoSampleBuffer: previewBuffer) {
                                       
                                       
                                     print("image: \(UIImage(data: dataImage)?.size)") // Your Image
                                       
                                       let path =  FileManager.default.temporaryDirectory.appendingPathComponent("preview", conformingTo: .jpeg)
                                       let success = try? dataImage.write(to: path)
                                       if let success {
                                           print("File written success")
                                       }
                                       
                                   }
                        
                    }
                }
                
                let session  = AVCaptureSession()
                let output = AVCapturePhotoOutput()
                
                if let device = AVCaptureDevice.default(for: .video) {
                    do {
                        
                        let input = try AVCaptureDeviceInput(device: device)
                        if session.canAddInput(input) {
                            session.addInput(input)
                        }
                        
                        if session.canAddOutput(output) {
                            session.addOutput(output)
                        }
                    }
                    catch {
                        print(error)
                    }
                }
                
                let settings = AVCapturePhotoSettings()
                let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
                    let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
                                              kCVPixelBufferWidthKey as String: 160,
                                              kCVPixelBufferHeightKey as String: 160]
                    settings.previewPhotoFormat = previewFormat
                    
                
                    session.startRunning()
                    output.capturePhoto(with: settings, delegate:MyDelegate() )
                
                
                
                
               let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
               let image = renderer.image { context in
                 view.layer.render(in: context.cgContext)
               }
               return image
             }
        }

        func dataScanner(_ dataScanner: DataScannerViewController, didRemove removedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            
            self.recognizedItems = recognizedItems.filter { item in
                !removedItems.contains(where: {$0.id == item.id })
            }
        }

        func dataScanner(_ dataScanner: DataScannerViewController, becameUnavailableWithError error: DataScannerViewController.ScanningUnavailable) {
            print("became unavailable with error \(error.localizedDescription)")
        }
    }
}



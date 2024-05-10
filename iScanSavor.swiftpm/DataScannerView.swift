import Foundation
import SwiftUI
import VisionKit
import AVFoundation
//
//struct DataScannerView: UIViewControllerRepresentable {
//    @Binding var recognizedItems: [RecognizedItem]
//    @Binding var showAlert: Bool
//    @Binding var navigateToProfileView: Bool
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
//        if navigateToProfileView {
//            uiViewController.stopScanning()
//        } else {
//            try? uiViewController.startScanning()
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(recognizedItems: $recognizedItems, showAlert: $showAlert, navigateToProfileView: $navigateToProfileView)
//    }
//
//    class Coordinator: NSObject, DataScannerViewControllerDelegate {
//        @Binding var recognizedItems: [RecognizedItem]
//        @Binding var showAlert: Bool
//        @Binding var navigateToProfileView: Bool
//        var capturedImage: UIImage?
//
//        init(recognizedItems: Binding<[RecognizedItem]>, showAlert: Binding<Bool>, navigateToProfileView: Binding<Bool>) {
//            self._recognizedItems = recognizedItems
//            self._showAlert = showAlert
//            self._navigateToProfileView = navigateToProfileView
//            super.init()
//        }
//
//        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
//            print("didTapOn \(item)")
//        }
//
//        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            UINotificationFeedbackGenerator().notificationOccurred(.success)
//            recognizedItems.append(contentsOf: addedItems)
//            for item in addedItems {
//                switch item {
//                case .text(let text):
//                    for ingredient in ingredients {
//                        if text.transcript.lowercased().contains(ingredient.name) {
//                            DispatchQueue.main.async {
//                                
//                                let path =  FileManager.default.temporaryDirectory.appendingPathComponent("preview", conformingTo: .jpeg)
//                                
//                                if let screenshot = captureScreenshot(view: dataScanner.view) {
//                                }
//                                
//                                self.navigateToProfileView = true
//                            }
//                            
//                            break
//                        }
//                    }
//                default:
//                    break
//                }
//            }
////            for item in addedItems {
////                switch item {
////                case .text(let text):
////                  let lowercaseIngredients = text.transcript.lowercased().components(separatedBy: .whitespacesAndNewlines)
////                  for allergyInformation in allergyInformation {
////                    for userAllergy in allergyInformation.userSelectedAllergies {
////                      if lowercaseIngredients.contains(where: { ingredient in
////                        allergyInformation.ingredients.contains(ingredient.lowercased())
////                      }) {
////                        DispatchQueue.main.async {
////                          self.showAlert = true
////                          // Provide specific allergy information in the alert message
////                          print("Allergy risk detected for \(userAllergy)")
////                        }
////                        break // Exit inner loop if a match is found for the current allergy
////                      }
////                    }
////                  }
////                default:
////                  break
////                }
////              }
//            func captureScreenshot(view: UIView) -> UIImage? {
//                
//                class MyDelegate : NSObject, AVCapturePhotoCaptureDelegate {
//                    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: (any Error)?) {
//                        if let error = error {
//                                       print(error.localizedDescription)
//                                   }
//
//                                   if let sampleBuffer = photoSampleBuffer, let previewBuffer = previewPhotoSampleBuffer, let dataImage = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: sampleBuffer, previewPhotoSampleBuffer: previewBuffer) {
//                                       
//                                       
//                                     print("image: \(UIImage(data: dataImage)?.size)") // Your Image
//                                       
//                                       let path =  FileManager.default.temporaryDirectory.appendingPathComponent("preview", conformingTo: .jpeg)
//                                       let success = try? dataImage.write(to: path)
//                                       if let success {
//                                           print("File written success")
//                                       }
//                                       
//                                   }
//                        
//                    }
//                }
//                
//                let session  = AVCaptureSession()
//                let output = AVCapturePhotoOutput()
//                
//                if let device = AVCaptureDevice.default(for: .video) {
//                    do {
//                        
//                        let input = try AVCaptureDeviceInput(device: device)
//                        if session.canAddInput(input) {
//                            session.addInput(input)
//                        }
//                        
//                        if session.canAddOutput(output) {
//                            session.addOutput(output)
//                        }
//                    }
//                    catch {
//                        print(error)
//                    }
//                }
//                
//                let settings = AVCapturePhotoSettings()
//                let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
//                    let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
//                                              kCVPixelBufferWidthKey as String: 160,
//                                              kCVPixelBufferHeightKey as String: 160]
//                    settings.previewPhotoFormat = previewFormat
//                    
//                
//                    session.startRunning()
//                    output.capturePhoto(with: settings, delegate:MyDelegate() )
//                
//                
//                
//                
//               let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
//               let image = renderer.image { context in
//                 view.layer.render(in: context.cgContext)
//               }
//               return image
//             }
//        }
//
//        func dataScanner(_ dataScanner: DataScannerViewController, didRemove removedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            
//            self.recognizedItems = recognizedItems.filter { item in
//                !removedItems.contains(where: {$0.id == item.id })
//            }
//        }
//
//        func dataScanner(_ dataScanner: DataScannerViewController, becameUnavailableWithError error: DataScannerViewController.ScanningUnavailable) {
//            print("became unavailable with error \(error.localizedDescription)")
//        }
//    }
//}
//
//

//var cameraCapture:CameraPhotoCapture!
//struct DataScannerView: UIViewControllerRepresentable {
//    @Binding var recognizedItems: [RecognizedItem]
//    @Binding var showAlert: Bool
//    @Binding var navigateToProfileView: Bool
//    let recognizedDataType: DataScannerViewController.RecognizedDataType
//    let recognizesMultipleItems: Bool
//    
//    func makeUIViewController(context: Context) -> DataScannerViewController {
//        cameraCapture = CameraPhotoCapture()
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
//        if navigateToProfileView {
//            uiViewController.stopScanning()
//        } else {
//            try? uiViewController.startScanning()
//        }
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(recognizedItems: $recognizedItems, showAlert: $showAlert, navigateToProfileView: $navigateToProfileView)
//    }
//    
//    class Coordinator: NSObject, DataScannerViewControllerDelegate {
//        @Binding var recognizedItems: [RecognizedItem]
//        @Binding var showAlert: Bool
//        @Binding var navigateToProfileView: Bool
//        var capturedImage: UIImage?
//        
//        init(recognizedItems: Binding<[RecognizedItem]>, showAlert: Binding<Bool>, navigateToProfileView: Binding<Bool>) {
//            self._recognizedItems = recognizedItems
//            self._showAlert = showAlert
//            self._navigateToProfileView = navigateToProfileView
//            super.init()
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
//            print("didTapOn \(item)")
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            UINotificationFeedbackGenerator().notificationOccurred(.success)
//            recognizedItems.append(contentsOf: addedItems)
//            for item in addedItems {
//                switch item {
//                case .text(let text):
//                    for ingredient in ingredients {
//                        if text.transcript.lowercased().contains(ingredient.name) {
//                            DispatchQueue.main.async {
//                                Task {
//                                    do {
//                                        let image = try await dataScanner.capturePhoto()
//                                        let url = try FileManager.default
//                                            .url(for: .documentDirectory,
//                                                 in: .userDomainMask,
//                                                 appropriateFor: nil,
//                                                 create: true)
//                                            .appendingPathComponent("preview.jpeg")
//                                        if let data = image.jpegData(compressionQuality: 90) {
//                                            try data.write(to: url)
//                                        }
//                                        
//                                        
//                                    }catch {
//                                        print(error)
//                                    }
//                                }
//                                //cameraCapture.captureScreenshot()
//                                self.navigateToProfileView = true
//                            }
//                            
//                            break
//                        }
//                    }
//                default:
//                    break
//                }
//            }
//            
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didRemove removedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            
//            self.recognizedItems = recognizedItems.filter { item in
//                !removedItems.contains(where: {$0.id == item.id })
//            }
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, becameUnavailableWithError error: DataScannerViewController.ScanningUnavailable) {
//            print("became unavailable with error \(error.localizedDescription)")
//        }
//    }
//    
//}
//
//
//// DataScannerView.swift
//import Foundation
//import SwiftUI
//
//struct DataScannerView: UIViewControllerRepresentable {
//    @Binding var recognizedItems: [RecognizedItem]
//    @Binding var showAlert: Bool
//    @Binding var navigateToProfileView: Bool
//    let recognizedDataType: DataScannerViewController.RecognizedDataType
//    let recognizesMultipleItems: Bool
//    var cameraCapture: CameraPhotoCapture
//    let userSelectedAllergies: Set<String>
//    
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
//        if navigateToProfileView {
//            uiViewController.stopScanning()
//        } else {
//            try? uiViewController.startScanning()
//        }
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(recognizedItems: $recognizedItems, showAlert: $showAlert, navigateToProfileView: $navigateToProfileView, cameraCapture: cameraCapture,userSelectedAllergies: userSelectedAllergies)
//    }
//    
//    class Coordinator: NSObject, DataScannerViewControllerDelegate {
//        @Binding var recognizedItems: [RecognizedItem]
//          @Binding var showAlert: Bool
//          @Binding var navigateToProfileView: Bool
//          var capturedImage: UIImage?
//          var cameraCapture: CameraPhotoCapture
//          var userSelectedAllergies: Set<String>
//          
//          init(recognizedItems: Binding<[RecognizedItem]>, showAlert: Binding<Bool>, navigateToProfileView: Binding<Bool>, cameraCapture: CameraPhotoCapture, userSelectedAllergies: Set<String>) {
//              self._recognizedItems = recognizedItems
//              self._showAlert = showAlert
//              self._navigateToProfileView = navigateToProfileView
//              self.cameraCapture = cameraCapture
//              self.userSelectedAllergies = userSelectedAllergies
//              super.init()
//          }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
//            print("didTapOn \(item)")
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            UINotificationFeedbackGenerator().notificationOccurred(.success)
//            recognizedItems.append(contentsOf: addedItems)
//            for item in addedItems {
//                switch item {
//                case .text(let text):
//                    for ingredient in ingredients {
//                        if text.transcript.lowercased().contains(ingredient.name) {
//                            DispatchQueue.main.async {
//                                Task {
//                                    do {
//                                        let image = try await dataScanner.capturePhoto()
//                                        let url = try FileManager.default
//                                            .url(for: .documentDirectory,
//                                                 in: .userDomainMask,
//                                                 appropriateFor: nil,
//                                                 create: true)
//                                            .appendingPathComponent("preview.jpeg")
//                                        if let data = image.jpegData(compressionQuality: 90) {
//                                            try data.write(to: url)
//                                        }
//                                        
//                                        // Assign the captured image to cameraCapture
//                                        self.cameraCapture.capturedImage = image
//                                        self.navigateToProfileView = true
//                                    } catch {
//                                        print(error)
//                                    }
//                                }
//                            }
//                            
//                            break
//                        }
//                    }
//                default:
//                    break
//                }
//            }
//        }
//        func filterIngredients(for allergy: String, userAllergies: Set<String>) -> [String] {
//            var filteredIngredients: [String] = []
//        
//            for information in InfotmationModel().getAllAllergyInformation() {
//
//                if information.allergy == allergy && userAllergies.contains(allergy) {
//
//                    filteredIngredients.append(contentsOf: information.ingredients)
//                }
//            }     
//            print(filteredIngredients)
//            return filteredIngredients
//        }
//        func filterIngredients(for allergy: String, userAllergies: Set<String>) -> [String]? {
//            // Find the Information object corresponding to the provided allergy
//            guard let allergyInformation = InfotmationModel().getAllAllergyInformation().first(where: { $0.allergy == allergy }) else {
//                // If no information is found for the provided allergy, return nil
//                return nil
//            }
//            
//            // Return the ingredients associated with the allergy
//            return allergyInformation.ingredients
//        }
//       
//
//        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            UINotificationFeedbackGenerator().notificationOccurred(.success)
//            recognizedItems.append(contentsOf: addedItems)
//            
//   
//            let userSelectedAllergies = self.userSelectedAllergies
//            
//
//            for allergy in userSelectedAllergies {
//   print(allergy)
//                let allergyIngredients = filterIngredients(for: allergy, userAllergies: userSelectedAllergies)
//                print(allergyIngredients)
//                for item in addedItems {
//                    switch item {
//                    case .text(let text):
//
//                        for ingredient in allergyIngredients {
//                            if text.transcript.lowercased().contains(ingredient.lowercased()) {
//                                DispatchQueue.main.async {
//                                    Task {
//                                        do {
//                                            let image = try await dataScanner.capturePhoto()
//                                            let url = try FileManager.default
//                                                .url(for: .documentDirectory,
//                                                     in: .userDomainMask,
//                                                     appropriateFor: nil,
//                                                     create: true)
//                                                .appendingPathComponent("preview.jpeg")
//                                            if let data = image.jpegData(compressionQuality: 90) {
//                                                try data.write(to: url)
//                                            }
//                                            
//                                            // Assign the captured image to cameraCapture
//                                            self.cameraCapture.capturedImage = image
//                                            self.navigateToProfileView = true
//                                        } catch {
//                                            print(error)
//                                        }
//                                    }
//                                }
//                                
//                                break
//                            }
//                        }
//                    default:
//                        break
//                    }
//                }
//            }
//        }
//
//        func dataScanner(_ dataScanner: DataScannerViewController, didRemove removedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            self.recognizedItems = recognizedItems.filter { item in
//                !removedItems.contains(where: {$0.id == item.id })
//            }
//        }
//        
//        func dataScanner(_ dataScanner: DataScannerViewController, becameUnavailableWithError error: DataScannerViewController.ScanningUnavailable) {
//            print("became unavailable with error \(error.localizedDescription)")
//        }
//    }
//}
import Foundation
import SwiftUI

struct DataScannerView: UIViewControllerRepresentable {
    @Binding var recognizedItems: [RecognizedItem]
    @Binding var showAlert: Bool
    @Binding var navigateToProfileView: Bool
    let recognizedDataType: DataScannerViewController.RecognizedDataType
    let recognizesMultipleItems: Bool
    var cameraCapture: CameraPhotoCapture
//    let userSelectedAllergies: Set<String>
    
    
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
    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(recognizedItems: $recognizedItems, showAlert: $showAlert, navigateToProfileView: $navigateToProfileView, cameraCapture: cameraCapture,userSelectedAllergies: userSelectedAllergies)
//    }
    func makeCoordinator() -> Coordinator {
        Coordinator(recognizedItems: $recognizedItems, showAlert: $showAlert, navigateToProfileView: $navigateToProfileView, cameraCapture: cameraCapture)
    }
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        @Binding var recognizedItems: [RecognizedItem]
        @Binding var showAlert: Bool
        @Binding var navigateToProfileView: Bool
        var capturedImage: UIImage?
        var cameraCapture: CameraPhotoCapture
//        var userSelectedAllergies: Set<String>
        
        init(recognizedItems: Binding<[RecognizedItem]>, showAlert: Binding<Bool>, navigateToProfileView: Binding<Bool>, cameraCapture: CameraPhotoCapture) {
            self._recognizedItems = recognizedItems
            self._showAlert = showAlert
            self._navigateToProfileView = navigateToProfileView
            self.cameraCapture = cameraCapture
            super.init()
        }
        
//        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
//            print("didTapOn \(item)")
//        }
//
//        func filterIngredients(for allergy: String, userAllergies: Set<String>) -> [String]? {
//
//            guard let allergyInformation = InfotmationModel().getAllAllergyInformation().first(where: { $0.allergy == allergy && userAllergies.contains($0.allergy) }) else {
//                
//                return nil
//            }
//            
//            return allergyInformation.ingredients
//        }
//        func filterIngredients(for allergy: String, userAllergies: Set<String>) -> [String] {
//                    var filteredIngredients: [String] = []
//                
//                    for information in InfotmationModel().getAllAllergyInformation() {
//
//                        if information.allergy == allergy && userAllergies.contains(allergy) {
//
//                            filteredIngredients.append(contentsOf: information.ingredients)
//                        }
//                    }
//                    
//                    return filteredIngredients
//                }
//        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//            UINotificationFeedbackGenerator().notificationOccurred(.success)
//            recognizedItems.append(contentsOf: addedItems)
//
//            for allergy in userSelectedAllergies {
//                if let allergyIngredients = filterIngredients(for: allergy, userAllergies: userSelectedAllergies) {
//                    for item in addedItems {
//                        switch item {
//                        case .text(let text):
//                            for ingredient in allergyIngredients {
//                                if text.transcript.lowercased().contains(ingredient.lowercased()) {
//                                    DispatchQueue.main.async {
//                                        Task {
//                                            do {
//                                                let image = try await dataScanner.capturePhoto()
//                                                let url = try FileManager.default
//                                                    .url(for: .documentDirectory,
//                                                         in: .userDomainMask,
//                                                         appropriateFor: nil,
//                                                         create: true)
//                                                    .appendingPathComponent("preview.jpeg")
//                                                if let data = image.jpegData(compressionQuality: 90) {
//                                                    try data.write(to: url)
//                                                }
//                                                
//                                                // Assign the captured image to cameraCapture
//                                                self.cameraCapture.capturedImage = image
//                                                self.navigateToProfileView = true
//                                            } catch {
//                                                print(error)
//                                            }
//                                        }
//                                    }
//                                    
//                                    break
//                                }
//                            }
//                        default:
//                            break
//                        }
//                    }
//                }
//            }
//        }
        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
                    UINotificationFeedbackGenerator().notificationOccurred(.success)
                    recognizedItems.append(contentsOf: addedItems)
                    for item in addedItems {
                        switch item {
                        case .text(let text):
                            for ingredient in ingredients {
                                if text.transcript.lowercased().contains(ingredient.name) {
                                    DispatchQueue.main.async {
                                        Task {
                                            do {
                                                let image = try await dataScanner.capturePhoto()
                                                let url = try FileManager.default
                                                    .url(for: .documentDirectory,
                                                         in: .userDomainMask,
                                                         appropriateFor: nil,
                                                         create: true)
                                                    .appendingPathComponent("preview.jpeg")
                                                if let data = image.jpegData(compressionQuality: 90) {
                                                    try data.write(to: url)
                                                }
        
                                                self.cameraCapture.capturedImage = image
                                                self.navigateToProfileView = true
                                            }catch {
                                                print(error)
                                            }
                                        }
                                        //cameraCapture.captureScreenshot()
                                        
                                    }
        
                                    break
                                }
                            }
                        default:
                            break
                        }
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

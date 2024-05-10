import Foundation
import AVFoundation
import UIKit


var delegate = MyDelegate()


class CameraPhotoCapture {
    var captureSesssion: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    
    init(){
        captureSesssion = AVCaptureSession()
        captureSesssion.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        stillImageOutput = AVCapturePhotoOutput()
        
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if (captureSesssion.canAddInput(input)) {
                    captureSesssion.addInput(input)
                    if (captureSesssion.canAddOutput(stillImageOutput)) {
                        captureSesssion.addOutput(stillImageOutput)
                        captureSesssion.startRunning()
                    }
                }
            }
            
            catch {
                print(error)
            }
        }
        
    }
    
   
    
    
    
    func captureScreenshot() {
        let settingsForMonitoring = AVCapturePhotoSettings()
        settingsForMonitoring.flashMode = .auto
        settingsForMonitoring.isAutoStillImageStabilizationEnabled = true
        settingsForMonitoring.isHighResolutionPhotoEnabled = false
        stillImageOutput?.capturePhoto(with: settingsForMonitoring, delegate: delegate)
        
     }
}


class MyDelegate : NSObject, AVCapturePhotoCaptureDelegate {
    
    
    func photoOutput(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        if let err = error{
            print(error)
        }
        if let photoSampleBuffer = photoSampleBuffer {
            if let photoData = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer, previewPhotoSampleBuffer: previewPhotoSampleBuffer) {
                do {
                    let url = try FileManager.default
                        .url(for: .documentDirectory,
                             in: .userDomainMask,
                             appropriateFor: nil,
                             create: true)
                        .appendingPathComponent("preview.jpeg")
                    try photoData.write(to: url)
                    
                }catch {
                    print(error.localizedDescription)
                }
            }
            //let image = UIImage(data: photoData!)
            //UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        }
    }
}


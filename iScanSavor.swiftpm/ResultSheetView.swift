//
//  ResultSheetView.swift
//  BarCodeScanner
//
//  Created by Aditya Gaba on 07/05/24.
//

import SwiftUI


struct ResultSheetView: View {
    @State private var navigateToContentView: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var capturedImage: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                ModalContentView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Back")
                            .foregroundColor(.green)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack {
                        Spacer()
                        Text("Result")
                        Spacer()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        navigateToContentView = true
                    }) {
                        Text("Done")
                            .foregroundColor(.green)
                    }
                }
            }
            .fullScreenCover(isPresented: $navigateToContentView) {
                ContentView().navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct ModalContentView: View {
    var body: some View {
        VStack(spacing: 10) { // Add spacing between elements
            if let image = readImage() {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 250 , height: 250)
                    .offset(y:-70)

            } else {
                Image("foode")
                    .resizable()
                    .frame(width: 250 , height: 250)
                    .offset(y:-70)
            }
            
            VStack{
                Image(systemName: "x.circle")
                    .foregroundColor(.red)
                    .font(.system(size: 50))
                    
                    .cornerRadius(100)
                
                Text("This product is not safe for you.")
                    .font(.title3)
                    .foregroundColor(.red)
                    .lineSpacing(5) // Add line spacing for better readability
                    .offset(y:20)
            }
        }
        .offset(y:-50)

        .padding(20)
    }
    
    func readImage()->UIImage? {
        let path =  FileManager.default.temporaryDirectory.appendingPathComponent("preview", conformingTo: .jpeg)
        if let data = try? Data(contentsOf: path) {
            return UIImage(data: data)
        }
        else {
            return nil
        }
    }
}
//
//struct ResultSheetView: View {
//    @State private var navigateToContentView: Bool = false
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        NavigationView {
//            Button(action: {
//                navigateToContentView = true
//            }) {
//                Text("Done")
//                    .foregroundColor(.green)
//            }
//        }
//        .fullScreenCover(isPresented: $navigateToContentView) {
//            ContentView().navigationBarBackButtonHidden(true)
//        }
//    }
//}

struct ResultSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ResultSheetView()
    }
}

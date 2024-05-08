//import SwiftUI
//
//
//
//struct BarcodeTextScannerView: View {
//    @StateObject private var vm = AppViewModel()
//
//    var body: some View {
//        AllergyView()
//            .environmentObject(vm)
//            .task {
//                await vm.requestDataScannerAccessStatus()
//            }
//    }
//}
//struct BarcodeTextScannerApp: App {
//    @State private var selection = 0
//    
//    var body: some Scene {
//        WindowGroup {
//            BarcodeTextScannerView()
//
//            
//
//
//            .accentColor(.blue) // Change the color of the selected tab icon and text
////            ContentView()
////                .environmentObject(vm)
////                .task {
////                    await vm.requestDataScannerAccessStatus()
////                }
//        }
//    }
//}
//

import SwiftUI



struct BarcodeTextScannerView: View {
    @StateObject private var vm = AppViewModel()

    var body: some View {
        AllergyView()
      //  MainView()
            .environmentObject(vm)
            .task {
                await vm.requestDataScannerAccessStatus()
            }
    }
}
struct BarcodeTextScannerApp: App {
    @State private var selection = 0
    
    var body: some Scene {
        WindowGroup {
            BarcodeTextScannerView()

            .accentColor(.blue)
        }
    }
}


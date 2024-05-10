import SwiftUI
import VisionKit
//
//struct MainView: View {
//    
//    @EnvironmentObject var vm: AppViewModel
//    @State var isAlertVisible = false
//    @State private var isSettingViewActive = false
//    @State private var isMainViewActive = false
//    @State private var navigateToContentView: Bool = false
//    @State private var isSheetVisible = false
//
//    private let textContentTypes: [(title: String, textContentType: DataScannerViewController.TextContentType?)] = [
//    ]
//    
//    var body: some View {
//        switch vm.dataScannerAccessStatus {
//        case .scannerAvailable:
//            mainView
//        case .cameraNotAvailable:
//            Text("Your device doesn't have a camera")
//        case .scannerNotAvailable:
//            Text("Your device doesn't have support for scanning barcode with this app")
//        case .cameraAccessNotGranted:
//            Text("Please provide access to the camera in settings")
//        case .notDetermined:
//            Text("Requesting camera access")
//        }
//    }
//
//    
////    private var mainView: some View {
////        DataScannerView(
////            recognizedItems: $vm.recognizedItems,
////            showAlert: $isAlertVisible,
////            recognizedDataType: vm.recognizedDataType,
////            recognizesMultipleItems: vm.recognizesMultipleItems)
////        .background { Color.gray.opacity(0.3) }
////        .ignoresSafeArea()
////        .id(vm.dataScannerViewId)
////        .sheet(isPresented: .constant(true)) {
////            bottomContainerView
////                .background(.ultraThinMaterial)
////                .presentationDetents([.medium, .fraction(0.25)])
////                .presentationDragIndicator(.visible)
////                .interactiveDismissDisabled()
////                .onAppear {
////                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
////                          let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
////                        return
////                    }
////                    controller.view.backgroundColor = .clear
////                }
////        }
//////        
//////        .alert(
//////                    "Scan Results",
//////                    isPresented: $isAlertVisible
//////
//////                ) {
//////                    Button(role: .destructive) {
//////                        // Handle the deletion.
//////                    } label: {
//////                        Text("Delete")
//////                    }
//////                    Button("Retry") {
//////                        // Handle the retry action.
//////                    }
//////                     
//////                } message: {
//////                    Text("RESULTS")
//////                }
////        
////        
//////        .alert(
//////                    "Scan Results",
//////                    isPresented: $isAlertVisible
//////
//////                ) {
//////                    Button(role: .destructive) {
//////                        // Handle the deletion.
//////                    } label: {
//////                        Text("Delete")
//////                    }
//////                    Button("Retry") {
//////                        // Handle the retry action.
//////                    }
//////                    
//////                    Button(action: {
//////                    }) {
//////                        Text("Done")
//////                    }
//////                     
//////                } message: {
//////                    Text("RESULTS")
//////                }
////        .alert(
////            "Scan Results",
////            isPresented: $isAlertVisible
////        ) {
////            Button(role: .destructive) {
////                // Handle the deletion.
////            } label: {
////                Text("Delete")
////            }
////            Button("Retry") {
////                // Handle the retry action.
////            }
////            Button(action: {
////                navigateToContentView = true
////            }) {
////                Text("Done")
////            }
////        } message: {
////            Text("RESULTS")
////        }
////        
////        return NavigationLink(destination: ContentView(), isActive: $navigateToContentView) {
////              EmptyView()
////          }
////
////        .onChange(of: vm.scanType) { _ in vm.recognizedItems = [] }
////        .onChange(of: vm.textContentType) { _ in vm.recognizedItems = [] }
////        .onChange(of: vm.recognizesMultipleItems) { _ in vm.recognizedItems = []}
////    }
////    
//    
//    private var mainView: some View {
//        DataScannerView(
//            recognizedItems: $vm.recognizedItems,
//            showAlert: $isAlertVisible,
//            recognizedDataType: vm.recognizedDataType,
//            recognizesMultipleItems: vm.recognizesMultipleItems)
//        .background { Color.gray.opacity(0.3) }
//        .ignoresSafeArea()
//        .id(vm.dataScannerViewId)
//        .sheet(isPresented: .constant(true)) {
//            bottomContainerView
//                .background(.ultraThinMaterial)
//                .presentationDetents([.medium, .fraction(0.25)])
//                .presentationDragIndicator(.visible)
//                .interactiveDismissDisabled()
//                .onAppear {
//                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//                          let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
//                        return
//                    }
//                    controller.view.backgroundColor = .clear
//                }
//        }
////        .alert(
////            "Scan Results",
////            isPresented: $isAlertVisible
////        ) {
////            Button(role: .destructive) {
////                // Handle the deletion.
////            } label: {
////                Text("Delete")
////            }
////            Button("Retry") {
////                // Handle the retry action.
////            }
////            Button(action: {
////                navigateToContentView = true
////            }) {
////                Text("Done")
////            }
////        } message: {
////      //    Text("RESULTS")
////          //  Image(systemName: "xmark.circle")
//////                .resizable()
//////                .frame(width: 50, height: 50)
//////                .foregroundColor(.red)
////            Text("This product contains harmful ingredients for your health.")
//////                .foregroundColor(.red)
//////                .padding()
////
////        }
////        .background(
////            NavigationLink(destination: ContentView(), isActive: $navigateToContentView) {
////              //  EmptyView()
////            }
////        )
//        .alert(
//            "Scan Results",
//            isPresented: $isAlertVisible
//        ) {
//            Button(role: .destructive) {
//                // Handle the deletion.
//            } label: {
//                Text("Delete")
//            }
//            Button("Retry") {
//                // Handle the retry action.
//            }
//            Button(action: {
//                navigateToContentView = true
//            }) {
//                Text("Done")
//            }
//        } message: {
//      //    Text("RESULTS")
//          //  Image(systemName: "xmark.circle")
////                .resizable()
////                .frame(width: 50, height: 50)
////                .foregroundColor(.red)
//            Text("This product contains harmful ingredients for your health.")
////                .foregroundColor(.red)
////                .padding()
//
//        }
//        .background(
//            NavigationLink(destination: ContentView(), isActive: $navigateToContentView) {
//              //  EmptyView()
//            }
//        )
//        .onChange(of: vm.scanType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.textContentType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.recognizesMultipleItems) { _ in vm.recognizedItems = []}
//    }
//    private var headerView: some View {
//        VStack {
//            HStack {
//                Picker("Scan Type", selection: $vm.scanType) {
//                    Text("Barcode").tag(ScanType.barcode)
//                    Text("Text").tag(ScanType.text)
//                }.pickerStyle(.segmented)
//                
//              //  Toggle("Scan multiple", isOn: $vm.recognizesMultipleItems)
//            }.padding(.top)
//            
//            if vm.scanType == .text {
//                Picker("Text content type", selection: $vm.textContentType) {
//                    ForEach(textContentTypes, id: \.self.textContentType) { option in
//                        Text(option.title).tag(option.textContentType)
//                    }
//                }.pickerStyle(.segmented)
//            }
//            
//            Text(vm.headerText).padding(.top)
//        }.padding(.horizontal)
//    }
//    
//    private var bottomContainerView: some View {
//        VStack {
//            headerView
//            ScrollView {
//                LazyVStack(alignment: .leading, spacing: 16) {
//                    ForEach(vm.recognizedItems) { item in
//                        switch item {
//                        case .barcode(let barcode):
//                            Text(barcode.payloadStringValue ?? "Unknown barcode")
//                            
//                        case .text(let text):
//                            Text(text.transcript)
//                            
//                        @unknown default:
//                            Text("Unknown")
//                        }
//                    }
//                }
//                .padding()
//            }
//        }
//    }
//    
//}
//
//#Preview {
//    MainView()
//}


import SwiftUI
import VisionKit
//
//struct MainView: View {
//    
//    @EnvironmentObject var vm: AppViewModel
//    @State var isAlertVisible = false
//    @State private var isSettingViewActive = false
//    @State private var isMainViewActive = false
//    @State private var navigateToContentView: Bool = false
//    @State private var isSheetVisible = false
//
//    private let textContentTypes: [(title: String, textContentType: DataScannerViewController.TextContentType?)] = [
//    ]
//    
//    var body: some View {
//        switch vm.dataScannerAccessStatus {
//        case .scannerAvailable:
//            mainView
//        case .cameraNotAvailable:
//            Text("Your device doesn't have a camera")
//        case .scannerNotAvailable:
//            Text("Your device doesn't have support for scanning barcode with this app")
//        case .cameraAccessNotGranted:
//            Text("Please provide access to the camera in settings")
//        case .notDetermined:
//            Text("Requesting camera access")
//        }
//        
//    }
//    
//
////
//    
//    private var mainView: some View {
//        DataScannerView(
//            recognizedItems: $vm.recognizedItems,
//            showAlert: $isAlertVisible,
//            recognizedDataType: vm.recognizedDataType,
//            recognizesMultipleItems: vm.recognizesMultipleItems)
//        .background { Color.gray.opacity(0.3) }
//        .ignoresSafeArea()
//        .id(vm.dataScannerViewId)
//        .sheet(isPresented: .constant(true)) {
//            bottomContainerView
//                .background(.ultraThinMaterial)
//                .presentationDetents([.medium, .fraction(0.25)])
//                .presentationDragIndicator(.visible)
//                .interactiveDismissDisabled()
//                .onAppear {
//                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//                          let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
//                        return
//                    }
//                    controller.view.backgroundColor = .clear
//                }
//        }
//
//        .alert(
//            "Scan Results",
//            isPresented: $isAlertVisible
//        ) {
//            Button(role: .destructive) {
//                // Handle the deletion.
//            } label: {
//                Text("Delete")
//            }
//            Button("Retry") {
//                // Handle the retry action.
//            }
//            Button(action: {
//                navigateToContentView = true
//            }) {
//                Text("Done")
//            }
//        } message: {
//      //    Text("RESULTS")
//          //  Image(systemName: "xmark.circle")
////                .resizable()
////                .frame(width: 50, height: 50)
////                .foregroundColor(.red)
//            Text("This product contains harmful ingredients for your health.")
////                .foregroundColor(.red)
////                .padding()
//
//        }
//        .background(
////            NavigationLink(destination: ContentView(), isActive: $navigateToContentView) {
////              //  EmptyView()
////            }
//            NavigationLink(destination: ProfileView(), isActive: $navigateToContentView) {
//              //  EmptyView()
//            }
//        )
//        .onChange(of: vm.scanType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.textContentType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.recognizesMultipleItems) { _ in vm.recognizedItems = []}
//    }
//    
//    private var headerView: some View {
//        VStack {
//            HStack {
//                Picker("Scan Type", selection: $vm.scanType) {
//                    Text("Barcode").tag(ScanType.barcode)
//                    Text("Text").tag(ScanType.text)
//                }.pickerStyle(.segmented)
//                
//              //  Toggle("Scan multiple", isOn: $vm.recognizesMultipleItems)
//            }.padding(.top)
//            
//            if vm.scanType == .text {
//                Picker("Text content type", selection: $vm.textContentType) {
//                    ForEach(textContentTypes, id: \.self.textContentType) { option in
//                        Text(option.title).tag(option.textContentType)
//                    }
//                }.pickerStyle(.segmented)
//            }
//            
//            Text(vm.headerText).padding(.top)
//        }.padding(.horizontal)
//    }
//    
//    private var bottomContainerView: some View {
//        VStack {
//            headerView
//            ScrollView {
//                LazyVStack(alignment: .leading, spacing: 16) {
//                    ForEach(vm.recognizedItems) { item in
//                        switch item {
//                        case .barcode(let barcode):
//                            Text(barcode.payloadStringValue ?? "Unknown barcode")
//                            
//                        case .text(let text):
//                            Text(text.transcript)
//                            
//                        @unknown default:
//                            Text("Unknown")
//                        }
//                    }
//                }
//                .padding()
//            }
//        }
//    }
//    
//    
//}
//
//#Preview {
//    MainView()
//}


//import SwiftUI
//import VisionKit
//
//struct MainView: View {
//    
//    @EnvironmentObject var vm: AppViewModel
//    @State var isAlertVisible = false
//    @State private var isSettingViewActive = false
//    @State private var isMainViewActive = false
//    @State private var navigateToContentView: Bool = false
//    @State private var isSheetVisible = false
//
//    private let textContentTypes: [(title: String, textContentType: DataScannerViewController.TextContentType?)] = [
//    ]
//    
//    var body: some View {
//        switch vm.dataScannerAccessStatus {
//        case .scannerAvailable:
//            mainView
//        case .cameraNotAvailable:
//            Text("Your device doesn't have a camera")
//        case .scannerNotAvailable:
//            Text("Your device doesn't have support for scanning barcode with this app")
//        case .cameraAccessNotGranted:
//            Text("Please provide access to the camera in settings")
//        case .notDetermined:
//            Text("Requesting camera access")
//        }
//        
//    }
//    
//
////
//    
//    private var mainView: some View {
//        DataScannerView(
//            recognizedItems: $vm.recognizedItems,
//            showAlert: $isAlertVisible,
//            recognizedDataType: vm.recognizedDataType,
//            recognizesMultipleItems: vm.recognizesMultipleItems)
//        .background { Color.gray.opacity(0.3) }
//        .ignoresSafeArea()
//        .id(vm.dataScannerViewId)
//        .sheet(isPresented: .constant(true)) {
//            bottomContainerView
//                .background(.ultraThinMaterial)
//                .presentationDetents([.medium, .fraction(0.25)])
//                .presentationDragIndicator(.visible)
//                .interactiveDismissDisabled()
//                .onAppear {
//                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//                          let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
//                        return
//                    }
//                    controller.view.backgroundColor = .clear
//                }
//        }

//        .alert(
//            "Scan Results",
//            isPresented: $isAlertVisible
//        ) {
//            Button(role: .destructive) {
//                // Handle the deletion.
//            } label: {
//                Text("Delete")
//            }
//            Button("Retry") {
//                // Handle the retry action.
//            }
//            Button(action: {
//                navigateToContentView = true
//            }) {
//                Text("Done")
//            }
//        } message: {
//      //    Text("RESULTS")
//          //  Image(systemName: "xmark.circle")
////                .resizable()
////                .frame(width: 50, height: 50)
////                .foregroundColor(.red)
//            Text("This product contains harmful ingredients for your health.")
////                .foregroundColor(.red)
////                .padding()
//
//        }
//        .background(
//            NavigationLink(destination: ProfileView(), isActive: $navigateToContentView) {
//              //  EmptyView()
//            }
//        )
//        .onChange(of: vm.scanType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.textContentType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.recognizesMultipleItems) { _ in vm.recognizedItems = []}
//    }
//    
//    private var headerView: some View {
//        VStack {
//            HStack {
//                Picker("Scan Type", selection: $vm.scanType) {
//                    Text("Barcode").tag(ScanType.barcode)
//                    Text("Text").tag(ScanType.text)
//                }.pickerStyle(.segmented)
//                
//              //  Toggle("Scan multiple", isOn: $vm.recognizesMultipleItems)
//            }.padding(.top)
//            
//            if vm.scanType == .text {
//                Picker("Text content type", selection: $vm.textContentType) {
//                    ForEach(textContentTypes, id: \.self.textContentType) { option in
//                        Text(option.title).tag(option.textContentType)
//                    }
//                }.pickerStyle(.segmented)
//            }
//            
//            Text(vm.headerText).padding(.top)
//        }.padding(.horizontal)
//    }
//    
//    private var bottomContainerView: some View {
//        VStack {
//            headerView
//            ScrollView {
//                LazyVStack(alignment: .leading, spacing: 16) {
//                    ForEach(vm.recognizedItems) { item in
//                        switch item {
//                        case .barcode(let barcode):
//                            Text(barcode.payloadStringValue ?? "Unknown barcode")
//                            
//                        case .text(let text):
//                            Text(text.transcript)
//                            
//                        @unknown default:
//                            Text("Unknown")
//                        }
//                    }
//                }
//                .padding()
//            }
//        }
//    }
//    
//    
//}
//
//#Preview {
//    MainView()
//}

//
//struct MainView: View {
//    
//    @EnvironmentObject var vm: AppViewModel
//    @State var isAlertVisible = false
//    @State private var isSettingViewActive = false
//    @State private var isMainViewActive = false
//    @State private var navigateToProfileView: Bool = false
//    @State private var isSheetVisible = false
////    @State static var navigateToContentView = false
//
//
//    private let textContentTypes: [(title: String, textContentType: DataScannerViewController.TextContentType?)] = [
//    ]
//    
//    var body: some View {
//        switch vm.dataScannerAccessStatus {
//        case .scannerAvailable:
//            mainView
//        case .cameraNotAvailable:
//            Text("Your device doesn't have a camera")
//        case .scannerNotAvailable:
//            Text("Your device doesn't have support for scanning barcode with this app")
//        case .cameraAccessNotGranted:
//            Text("Please provide access to the camera in settings")
//        case .notDetermined:
//            Text("Requesting camera access")
//        }
//    }
//
//    private var mainView: some View {
//        DataScannerView(
//            recognizedItems: $vm.recognizedItems,
//            showAlert: $isAlertVisible,
//            navigateToProfileView: $navigateToProfileView, recognizedDataType: vm.recognizedDataType,
//            recognizesMultipleItems: vm.recognizesMultipleItems // Pass navigateToProfileView binding here
//        )
//        .background { Color.gray.opacity(0.3) }
//        .ignoresSafeArea()
//        .id(vm.dataScannerViewId)
//        .sheet(isPresented: $navigateToProfileView) {
////            
////            ResultSheetView(navigateToContentView: MainView.$navigateToContentView)
//            ResultSheetView()
//        }
//        .sheet(isPresented: .constant(true)) {
//            bottomContainerView
//                .background(.ultraThinMaterial)
//                .presentationDetents([.medium, .fraction(0.25)])
//                .presentationDragIndicator(.visible)
//                .interactiveDismissDisabled()
//                .onAppear {
//                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//                          let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
//                        return
//                    }
//                    controller.view.backgroundColor = .clear
//                }
//        }
//
//        .onChange(of: vm.scanType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.textContentType) { _ in vm.recognizedItems = [] }
//        .onChange(of: vm.recognizesMultipleItems) { _ in vm.recognizedItems = []}
//    }
//
//    private var headerView: some View {
//        VStack {
//            HStack {
//                Picker("Scan Type", selection: $vm.scanType) {
//                    Text("Text").tag(ScanType.text)
//                    Text("Barcode").tag(ScanType.barcode)
//                   
//                }.pickerStyle(.segmented)
//            }.padding(.top)
//            
//            if vm.scanType == .text {
//                Picker("Text content type", selection: $vm.textContentType) {
//                    ForEach(textContentTypes, id: \.self.textContentType) { option in
//                        Text(option.title).tag(option.textContentType)
//                    }
//                }.pickerStyle(.segmented)
//            }
//            
//            Text(vm.headerText).padding(.top)
//        }.padding(.horizontal)
//    }
//
//    private var bottomContainerView: some View {
//        VStack {
//            headerView
//            ScrollView {
//                LazyVStack(alignment: .leading, spacing: 16) {
//                    ForEach(vm.recognizedItems) { item in
//                        switch item {
//                    
//                        case .text(let text):
//                            Text(text.transcript)
//                        case .barcode(let barcode):
//                            Text(barcode.payloadStringValue ?? "Unknown barcode")
//                            
//                        @unknown default:
//                            Text("Unknown")
//                        }
//                    }
//                }
//                .padding()
//            }
//        }
//    }
//}

struct MainView: View {
    @EnvironmentObject var vm: AppViewModel
    @State var isAlertVisible = false
    @State private var isSettingViewActive = false
    @State private var isMainViewActive = false
    @State private var navigateToProfileView: Bool = false
    @State private var isSheetVisible = false
    @State private var userSelectedAllergies: Set<String> = []
    @ObservedObject private var cameraCapture = CameraPhotoCapture()

    private let textContentTypes: [(title: String, textContentType: DataScannerViewController.TextContentType?)] = []

    var body: some View {
        switch vm.dataScannerAccessStatus {
        case .scannerAvailable:
            mainView
        case .cameraNotAvailable:
            Text("Your device doesn't have a camera")
        case .scannerNotAvailable:
            Text("Your device doesn't have support for scanning barcode with this app")
        case .cameraAccessNotGranted:
            Text("Please provide access to the camera in settings")
        case .notDetermined:
            Text("Requesting camera access")
        }
    }

    private var mainView: some View {
        @State var selectedAllergies: String
        return DataScannerView(
            recognizedItems: $vm.recognizedItems,
            showAlert: $isAlertVisible,
            navigateToProfileView: $navigateToProfileView,
            recognizedDataType: vm.recognizedDataType,
            recognizesMultipleItems: vm.recognizesMultipleItems,
            cameraCapture: cameraCapture
        )
        .onAppear {
            // Set the default scan type to Text when the scanner view appears
            vm.scanType = .text
        }
        .background { Color.gray.opacity(0.3) }
        .ignoresSafeArea()
        .id(vm.dataScannerViewId)
        .sheet(isPresented: $navigateToProfileView) {
            ResultSheetView()
        }
        .sheet(isPresented: .constant(true)) {
            bottomContainerView
                .background(.ultraThinMaterial)
                .presentationDetents([.medium, .fraction(0.25)])
                .presentationDragIndicator(.visible)
                .interactiveDismissDisabled()
                .onAppear {
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                          let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
                        return
                    }
                    controller.view.backgroundColor = .clear
                }
        }
        .onChange(of: vm.scanType) { _ in vm.recognizedItems = [] }
        .onChange(of: vm.textContentType) { _ in vm.recognizedItems = [] }
        .onChange(of: vm.recognizesMultipleItems) { _ in vm.recognizedItems = []}
    }

    private var headerView: some View {
        VStack {
            HStack {
                Picker("Scan Type", selection: $vm.scanType) {
                    Text("Text").tag(ScanType.text)
                    Text("Barcode").tag(ScanType.barcode)
                }.pickerStyle(.segmented)
            }.padding(.top)
            
            if vm.scanType == .text {
                Picker("Text content type", selection: $vm.textContentType) {
                    ForEach(textContentTypes, id: \.self.textContentType) { option in
                        Text(option.title).tag(option.textContentType)
                    }
                }.pickerStyle(.segmented)
            }
            
            Text(vm.headerText).padding(.top)
        }.padding(.horizontal)
    }

    private var bottomContainerView: some View {
        VStack {
            headerView
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(vm.recognizedItems) { item in
                        switch item {
                            case .text(let text):
                                Text(text.transcript)
                            case .barcode(let barcode):
                                Text(barcode.payloadStringValue ?? "Unknown barcode")
                            @unknown default:
                                Text("Unknown")
                        }
                    }
                }
                .padding()
            }
        }
    }
}

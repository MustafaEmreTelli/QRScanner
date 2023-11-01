import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with the camera.",
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidScannedType = AlertItem(title: "Invalid Device Input",
                                              message: "The QR Code is not valid.",
                                              dismissButton: .default(Text("Ok")))
    
    static let cameraPermissionDenied = AlertItem(title: "Camera Permission Is needed in order to scan the QR codes",
                                                  message: "In order to scan the QR codes, go to -> Settings -> QR Scanner -> Allow acces to the camera",
                                                  dismissButton: .default(Text("Ok")))
}

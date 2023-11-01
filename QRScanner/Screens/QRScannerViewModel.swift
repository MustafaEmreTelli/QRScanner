import SwiftUI

final class QRScannerViewModel: ObservableObject{
    @Published var scannedCode: String = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String{
        scannedCode.isEmpty ? "No active QR" : scannedCode
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .gray : .blue
    }
    
}

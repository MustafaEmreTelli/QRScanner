import SwiftUI

struct QRScannerView: View {
    @StateObject var viewModel = QRScannerViewModel()
    @State private var isShowingSafariView = false
    
    var body: some View {
        NavigationView {
            VStack{
                ScannerView(scannedCode: $viewModel.scannedCode,
                            alertItem: $viewModel.alertItem)
                    .frame(maxWidth: 600, maxHeight: 450)
                    .cornerRadius(9.0)
                
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned QR Code:",
                      systemImage: "qrcode.viewfinder")
                    .font(.title)
                
                Button {
                    isShowingSafariView = true
                } label: {
                    Text(viewModel.statusText)
                        .bold()
                        .font(.title)
                        .foregroundColor(viewModel.statusTextColor)
                        .padding()
                }
                .sheet(isPresented: $isShowingSafariView, content: {
                    SafariView(url: URL(string: viewModel.scannedCode) ?? URL(string: "www.apple.com")!)
                })
            }
            .onChange(of: viewModel.scannedCode) {
                isShowingSafariView = true
            }
            .navigationTitle("QR Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}


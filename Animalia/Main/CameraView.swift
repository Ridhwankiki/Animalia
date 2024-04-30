//
//  CameraView.swift
//  Animalia
//
//  Created by MacBook Pro on 30/04/24.
//

import SwiftUI
import VisionKit

struct CameraView: View {
    
    @State private var startScanning = false
    @State private var scanText = ""
    
    
    
    var body: some View {
        VStack {
            // TOP VIEW
            ZStack {
                DataScanner(startScanning: $startScanning, scanText: $scanText)
                    .frame(height: 400)
                
                Text("tap to capture")
                    .font(.callout)
                    .fontWeight(.thin)
                    .foregroundStyle(.accent)
            }
            
            //BOTTOM VIEW
            ZStack {
                Text(scanText)
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                    .background(in: Rectangle())
                    .backgroundStyle(Color(uiColor: .systemGray6))
                
                Button {
                    
                } label: {
                    Label("Copy", systemImage: "doc.on.doc")
                }
                .padding()
            }
        }
        .task {
            if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                startScanning.toggle()
            }
        }
    }
}

#Preview {
    CameraView()
}

//
//  MainView.swift
//  Animalia
//
//  Created by MacBook Pro on 29/04/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            BrowseView()
                .tabItem {
                    Label("Browsw", systemImage: "square.grid.2x2")
                }
            
            WatchView()
                .tabItem {
                    Label("Watch", systemImage: "play.rectangle")
                }
            
            CameraView()
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }
            
            MapView()
                .tabItem {
                    Label("Locations", systemImage: "map")
                }
            
            GalleryView()
                .tabItem {
                    Label("Gallery", systemImage: "photo")
                }
            
            AlbumView()
                .tabItem {
                    Label("Photos", systemImage: "photo.on.rectangle.angled")
                }
        }
    }
}

#Preview {
    MainView()
}

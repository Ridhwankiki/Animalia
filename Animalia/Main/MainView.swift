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
            ContentView()
                .tabItem {
                    Label("Browsw", systemImage: "square.grid.2x2")
                }
            
            Text("Video view")
                .tabItem {
                    Label("Watch", systemImage: "play.rectangle")
                }
            
            Text("Map View")
                .tabItem {
                    Label("Locations", systemImage: "map")
                }
            
            Text("Gallery")
                .tabItem {
                    Label("Gallery", systemImage: "photo")
                }
        }
    }
}

#Preview {
    MainView()
}

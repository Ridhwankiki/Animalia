//
//  AnimalDetailView.swift
//  Animalia
//
//  Created by MacBook Pro on 29/04/24.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal: AnimalModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            // MARK: - Image
            Image(animal.image)
                .resizable()
                .scaledToFill()
            
            // MARK: - Name
            Text(animal.name.uppercased())
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.vertical, 8)
                .background(Color.accent.frame(height: 6).offset(y: 24))
            
            // MARK: - Headline
            Text(animal.headline)
                .font(.headline)
                .foregroundStyle(.accent)
                .padding()
            
            // MARK: - Gallery
            Group {
                HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                
                InsetGalleryView(animal: animal)
            }
            .padding()
            
            Group {
                HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                
                InsetFactView(animal: animal)
            }
            .padding()
            
            Group {
                HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                
                Text(animal.description)
            }
            .padding()
//            .font(.subheadline)
            
            Group {
                HeadingView(headingImage: "map", headingText: "National Park")
                
                InsetMapView()
            }
            .padding()
        }
        .navigationTitle("Learning about \(animal.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let animals : [AnimalModel] = Bundle.main.decode("animals.json")
    return AnimalDetailView(animal: animals[2])
}

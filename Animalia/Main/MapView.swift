//
//  MapView.swift
//  Animalia
//
//  Created by MacBook Pro on 30/04/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // MARK: - REGION
    @State private var region: MKCoordinateRegion = {
        
        // buat dapetin nilai center map
        var mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        
        // buat dapetin nilai span atau zoom level
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        //buat dapetin map region
        var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
        
        return mapRegion
        
    }()
    
    // MARK: - PROPERTIES
    let locations: [LocationModel] = Bundle.main.decode("locations.json")

    
    var body: some View {
        ZStack(alignment: .top) {
//            // MARK: - BASIC MAP
//            Map(coordinateRegion: $region)
            
            // MARK: - ADVANCE MAP
            Map(coordinateRegion: $region, annotationItems: locations) { item in
                // 1. OLD STYLE
//                MapPin(coordinate: item.location, tint: .accent)
                
                // 2. MARKER : NEW STYLE MAP STATIS
//                MapMarker(coordinate: item.location, tint: .accent)
                
                // 3. CUSTOM MAP BASIC
//                MapAnnotation(coordinate: item.location) {
//                    Image(.logo)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 32, height: 32)
//                }
                // 4. CUSTOM ADVANCE ANNOTATION
                MapAnnotation(coordinate: item.location) {
                    MapAnnotationView(location: item)
                }
            } //: MAP
            Group {
                HStack(spacing: 12) {
                    Image(.compass)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                    
                    VStack(spacing: 12) {
                        HStack {
                            Text("Latitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundStyle(.accent)
                            
                            Spacer()
                            
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .foregroundStyle(.white)
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("Longitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundStyle(.accent)
                            
                            Spacer()
                            
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .foregroundStyle(.white)
                        }
                        
                        
                    }
                    
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background (
                    Color.black
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .opacity(0.5)
            )
            }
            .padding()
        }
    }
}

#Preview {
    MapView()
}

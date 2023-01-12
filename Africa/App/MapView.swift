//
//  MapView.swift
//  Africa
//
//  Created by Giap on 12/01/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //MARK: - PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: - BODY
    var body: some View {
        //MARK: 1. BASIC MAP
        //Map(coordinateRegion: $region)
        
        //MARK: 2. MAP WITH ANNOTATIONS
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            //PIN
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            //MARKER from SwiftUI
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            //CUSTOM ANNOTATION with AppLogo
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }//: MapAnnotation
            
            //CUSTOM ANNOTATION DYNAMIC
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }//: MapAnnotation
        })//: MAP
        .overlay (
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//: HStack
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//: HStack
                }//: VStack
            }//: HStack
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
            , alignment: .top
        )
    }
}


//MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

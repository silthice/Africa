//
//  MainView.swift
//  Africa
//
//  Created by Giap on 12/01/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }//: ContentView
            
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }//: VideoListView
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }//: MapView
            
            GalleryView()
                .tabItem {
                   Image(systemName: "photo")
                    Text("Gallery")
                }//: GalleryView
        }//: TabView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

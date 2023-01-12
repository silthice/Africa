//
//  CoverImageView.swift
//  Africa
//
//  Created by Giap on 12/01/2023.
//

import SwiftUI

struct CoverImageView: View {
    
    //MARK: - PROPERTIES
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: - BODY
    var body: some View {
        
        TabView {
            ForEach(coverImages) { coverImage in
                Image(coverImage.name)
                    .resizable()
                    .scaledToFill()
            }//: ForEachLoop
        }//: TabView
        .tabViewStyle(PageTabViewStyle())
        
        
    }
}

//MARK: - PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}

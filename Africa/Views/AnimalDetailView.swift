//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Giap on 12/01/2023.
//

import SwiftUI

struct AnimalDetailView: View {
    
    //MARK: - PROPERTIES
    let animal: Animal
    
    //MARK: - BODY
 
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                //HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFill()
                
                //TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        //Color is a view in swiftUI, so can add mofifier to it
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                //HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                //GALLERY
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                }//: Group
                .padding(.horizontal)
                
                //FACTS
                
                //DESCRIPTION
                
                //MAP
                
                //LINK
                
            }//: VStack
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }//:ScrollView
        
    }
}

//MARK: - PREVIEW
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
    }
}

//
//  GalleryView.swift
//  Africa
//
//  Created by Giap on 12/01/2023.
//

import SwiftUI

struct GalleryView: View {
    
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var selecteAnimal: String = "lion"
    
    //SIMPLE GRID DEFINITION
    // let gridLayout: [GridItem] = [
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible())
    // ]
    
    //EFFICIENT GRID DEFINITION
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    
    //MARK: - FUNCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            //MARK: - SELECTED ANIMAL IMAGE
            Image(selecteAnimal)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(.white, lineWidth: 8))
            
            //MARK: - SLIDER
            //to control 2,3,4 grid options
            Slider(value: $gridColumn, in: 2...4, step: 1)
                .padding(.horizontal)
                .onChange(of: gridColumn, perform: { value in
                    withAnimation(.easeIn) {
                        gridSwitch()
                    }
                })
            
            //MARK: - GRID
            VStack {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 1))
                            .onTapGesture {
                                withAnimation(.easeIn) {
                                    selecteAnimal = animal.image
                                }
                                haptics.impactOccurred()
                            }
                    }//: ForEach
                }//: LazyVGrid
                .onAppear(perform: {
                    //by default, grid column default 1
                    //apply dynamic grid column of private var gridColumn from invoking gridSwitch
                    //when grid appear
                    gridSwitch()
                })
            }//: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//: ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

//MARL: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

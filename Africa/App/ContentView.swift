//
//  ContentView.swift
//  Africa
//
//  Created by Giap on 12/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive: Bool = false
    
    //default 2 grid
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    //default initial grid as 1 grid
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //MARK: - FUNCTIONS
    
    func gridSwitch() {
        //shortcuts for count increment after each grid press
        // 1 % 3 = 1 + 1 = 2
        // 2 % 3 = 2 + 1 = 3
        // 3 % 3 = 0 + 1 = 1
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1 )
        gridColumn = gridLayout.count
    }
    
    //MARK: - BODY
    
    var body: some View {
        NavigationView {
            
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//: NavigationLink
                        }//: ForEach
                    }//: List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//: NavigationLink
                            }//: ForEachLoop
                        }//: LazyVGrid
                        .padding(10)
                        .animation(.easeIn)
                    }//: ScrollView
                }//: IF Else
            } //: Group
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        //List
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        //GRID
                        Button(action: {
                            isGridViewActive = true
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }//: HStack
                }//: ToolbarItem
            }//: Toolbar
        }//: NavigationView
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

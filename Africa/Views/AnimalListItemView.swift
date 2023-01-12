//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Giap on 12/01/2023.
//

import SwiftUI

struct AnimalListItemView: View {
    //MARK: - PROPERTIES
    //MARK: - BODY
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image("lion")
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Lion")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text("The world's most social felines, lions roam the savannas and grasslands of the African continent, hunting coopertaitvely and raising cubs in prides.")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }//: VStack
        }//: HStack
    }
}

//MARK: - PREVIEW
struct AnimalListItemView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalListItemView()
    }
}

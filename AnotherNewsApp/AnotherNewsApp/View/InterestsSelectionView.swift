//
//  InterestsSelectionView.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import SwiftUI

struct InterestsSelectionView: View {
    let topic: Topic
    @Binding var items:[Topic]
    
    @State private var isSelected = false
    
    var body: some View {
        Text(topic.rawValue)
            .padding()
            .background(RoundedRectangle(cornerRadius: 30, style: .continuous).fill(isSelected ? Color.black : Color.white))
            .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(.gray, lineWidth: 2))
            .scaledToFill()
            .onTapGesture {
                isSelected.toggle()
                
                if isSelected {
                    items.append(topic)
                }
                else {
                    items.removeAll {$0 == topic}
                }
            }
            .foregroundColor(isSelected ? Color.white : Color.black)
            
    }
}

struct InterestsSelectionView_Previews: PreviewProvider {
    @State static var items: [Topic] = []
    static var previews: some View {
        InterestsSelectionView(topic: Topic.beauty, items: $items)
    }
}

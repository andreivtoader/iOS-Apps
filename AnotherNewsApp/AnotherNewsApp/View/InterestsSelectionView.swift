//
//  InterestsSelectionView.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import SwiftUI

struct InterestsSelectionView: View {
    @ObservedObject var manager: NewsManager
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach($manager.allTopics) { $topic in
                Text(topic.topic.rawValue)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 30, style: .continuous).fill(topic.isSelected ? Color.black : Color.white))
                    .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(.gray, lineWidth: 2))
                    .scaledToFill()
                    .onTapGesture {
                        topic.isSelected.toggle()
                    }
                    .foregroundColor(topic.isSelected ? Color.white : Color.black)
                
            }
        }
        .padding()
    }
}

//struct InterestsSelectionView_Previews: PreviewProvider {
//    @State static var items: [Topic] = []
//    static var previews: some View {
//        InterestsSelectionView(topic: Topic.beauty, items: $items)
//    }
//}

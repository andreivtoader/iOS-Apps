//
//  InterestsSelectionView.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import SwiftUI

struct InterestsSelectionView: View {
    let selectableTopic: SelectableTopic
    
    @ObservedObject var manager: NewsManager
    @State private var isSelected = false
    
    var body: some View {
        Text(selectableTopic.topic.rawValue)
            .padding()
            .background(RoundedRectangle(cornerRadius: 30, style: .continuous).fill(isSelected ? Color.black : Color.white))
            .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(.gray, lineWidth: 2))
            .scaledToFill()
            .onTapGesture {
                isSelected.toggle()
                
                if isSelected {
                    let buffer = SelectableTopic(topic: selectableTopic.topic, isSelected: self.isSelected)
                    manager.selectedTopics.append(buffer)
                }
                else {
                    manager.selectedTopics.removeAll {$0 == selectableTopic}
                }
            }
            .foregroundColor(isSelected ? Color.white : Color.black)
            .task {
                let selected = manager.isTopicSelected(selectableTopic)
                self.isSelected = selected
            }
            
    }
}

//struct InterestsSelectionView_Previews: PreviewProvider {
//    @State static var items: [Topic] = []
//    static var previews: some View {
//        InterestsSelectionView(topic: Topic.beauty, items: $items)
//    }
//}

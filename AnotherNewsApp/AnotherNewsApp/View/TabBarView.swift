//
//  TabBarView.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var manager: NewsManager
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal) {
                HStack {
                    ForEach(manager.selectedTopics.indices, id: \.self) { index in
                        Text(manager.selectedTopics[index].topic.rawValue)
                            .font(.subheadline)
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .foregroundColor(manager.selectedTopicIndex == index ? .white : .black)
                            .background(Capsule().foregroundColor(manager.selectedTopicIndex == index ? .black : .clear))
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    manager.selectedTopicIndex = index
                                }
                                
                                Task {
                                    let topic = Topic(rawValue: manager.selectedTopics[manager.selectedTopicIndex].topic.rawValue)!
                                    let selectableTopic = SelectableTopic(topic: topic, isSelected: false)
                                    
                                    await manager.getHeadlines(for: selectableTopic)
                                }
                            }
                    }
                }
            }
            .padding()
            .onChange(of: manager.selectedTopicIndex) { index in
                withAnimation {
                    scrollView.scrollTo(index, anchor: .center)
                }
            }
            
        }
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeView(selectedTopics: .constant(K.sampleData))
//    }
//}

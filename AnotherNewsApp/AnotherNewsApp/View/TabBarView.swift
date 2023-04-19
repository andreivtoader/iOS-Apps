//
//  TabBarView.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var manager: NewsManager
    @Binding var currentTabSelection: Int
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal) {
                HStack {
                    ForEach(manager.selectedTopics().indices, id: \.self) { index in
                        Text(manager.selectedTopics()[index].topic.rawValue)
                            .font(.subheadline)
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .foregroundColor(currentTabSelection == index ? .white : .black)
                            .background(Capsule().foregroundColor(currentTabSelection == index ? .black : .clear))
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    currentTabSelection = index
                                }
                                
                                Task {
                                    let topic = Topic(rawValue: manager.selectedTopics()[currentTabSelection].topic.rawValue)!
                                    let selectableTopic = SelectableTopic(topic: topic, isSelected: false)
                                    
                                    await manager.getHeadlines(for: selectableTopic)
                                }
                            }
                    }
                }
            }
            .padding()
            .onChange(of: currentTabSelection) { index in
                withAnimation {
                    scrollView.scrollTo(index, anchor: .center)
                }
            }
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var apiManager = NewsManager()
    static var previews: some View {
        WelcomeView(manager: apiManager)
    }
}

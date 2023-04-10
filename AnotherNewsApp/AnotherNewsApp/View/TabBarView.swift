//
//  TabBarView.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 09.04.2023.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var manager: NewsManager
    @Binding var menuTopicItems: [Topic]
    @State private var selectedIndex = 0
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal) {
                HStack {
                    ForEach(menuTopicItems.indices, id: \.self) { index in
                        Text(menuTopicItems[index].rawValue)
                            .font(.subheadline)
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .foregroundColor(selectedIndex == index ? .white : .black)
                            .background(Capsule().foregroundColor(selectedIndex == index ? .black : .clear))
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    selectedIndex = index
                                }
                                
                                Task {
                                    let topic = Topic(rawValue: menuTopicItems[index].rawValue)!
                                    await manager.getHeadlines(for: topic)
                                }
                            }
                    }
                }
            }
            .padding()
            .onChange(of: selectedIndex) { index in
                withAnimation {
                    scrollView.scrollTo(index, anchor: .center)
                }
            }
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

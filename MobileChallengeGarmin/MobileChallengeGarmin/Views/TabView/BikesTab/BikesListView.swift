//
//  BikesListView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct BikesListView: View {
//    let cards = [
//            CardView(title: "Card 1", description: "Description for Card 1"),
//            CardView(title: "Card 2", description: "Description for Card 2"),
//            CardView(title: "Card 3", description: "Description for Card 2"),
//            CardView(title: "Card 4", description: "Description for Card 2")
//        ]
    
    @ObservedObject var manager: BikeManager
    @State private var isPresented = false
    @State private var selectedBike: Bike?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(UIColor.tealishBlue).ignoresSafeArea()
                
                VStack {
                    HStack {
                        
                        Spacer()
                        
                        Button {
                            isPresented.toggle()
                        } label: {
                            Text("Add bike")
                                .padding()
                        }
                        .fullScreenCover(isPresented: $isPresented) {
                            AddBikeView(manager: manager)
                        }
                        
                    }
                    List {
                        ForEach(getAllBikesAsCardView(), id:\.bike.name) { card in
                                card
                                    .frame(height: geometry.size.height / 2.5)
                                .listRowBackground(Color(UIColor.tealishBlue))
                                .background(Color(UIColor.tealishBlue))
                                .onTapGesture {
                                    print("Tapped")
                                    self.selectedBike = card.bike
                                }
                        }
                    }
                    .background(Color(UIColor.tealishBlue))
                    .listStyle(.inset)
                    .scrollContentBackground(.hidden)
                }
                
            }
        }
        .sheet(item: $selectedBike) { item in
            BikeDetailsView(manager: manager, title: item.name, bike: $selectedBike)
        }
    }
    
    func getAllBikesAsCardView() -> [CardView] {
        var cards = [CardView]()
        
        for bike in self.manager.allBikes {
            print("Selected bike title: \(selectedBike?.name)")
            let card = CardView(bike: bike)
            cards.append(card)
        }
        return cards
    }
}

struct BikesListView_Previews: PreviewProvider {
    static var previews: some View {
        BikesListView(manager: BikeManager())
    }
}

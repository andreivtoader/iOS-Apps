//
//  RidesListView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 31.05.2023.
//

import SwiftUI
import Charts

struct RidesListView: View {
    @ObservedObject var manager: BikeManager
    @State private var isPresented = false
    
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
                            Text("Add ride")
                                .padding()
                        }
                        .fullScreenCover(isPresented: $isPresented) {
                            AddRideView(manager)
                        }
                    }
                    
                    //charts
                    
                    VStack {
                        HStack {
                            Image("icon_stats")
                            Text("All rides statistics")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        Chart {
                            BarMark(
                                x: .value("Bike", "Road"),
                                y: .value("Value", 5)
                            )
                            .foregroundStyle(Color("Watermelon"))
                            .annotation(position: .overlay, alignment: .bottom) {
                              Text("2500")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            
                            BarMark(
                                x: .value("Bike", "MTB"),
                                y: .value("Value", 4)
                            )
                            .foregroundStyle(Color("BurntYellow"))
                            .annotation(position: .overlay, alignment: .bottom) {
                              Text("2500")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            
                            BarMark(
                                x: .value("Bike", "Electric"),
                                y: .value("Bike", 7)
                            )
                            .foregroundStyle(Color("Pear"))
                            .annotation(position: .overlay, alignment: .bottom) {
                              Text("2500")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            
                            BarMark(
                                x: .value("Bike", "Hybrid"),
                                y: .value("Value", 9)
                            )
                            .foregroundStyle(Color("White"))
                            .annotation(position: .overlay, alignment: .bottom) {
                              Text("2500")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            
                        }
                        .frame(height: geometry.size.height / 2.5)
                        .chartXAxis {
                          AxisMarks(values: .automatic) { value in
                            AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2, 4]))
                              .foregroundStyle(Color.indigo)
                            AxisTick(stroke: StrokeStyle(lineWidth: 2))
                              .foregroundStyle(Color.mint)
                              AxisValueLabel() { // X VALUE LABELS
                                if let intValue = value.as(Int.self) {
                                  Text("\(intValue) km")
                                    .font(.system(size: 10)) // style it
                                    .foregroundColor(.white)
                                }
                              }
                          }
                        }
                        .chartYAxis {
                              AxisMarks(values: .automatic) { value in
                                AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2, 4]))
                                      .foregroundStyle(Color.indigo)
                                    AxisTick(stroke: StrokeStyle(lineWidth: 2))
                                      .foregroundStyle(Color.mint)
                              AxisValueLabel() { // Y VALUE LABELS
                                if let intValue = value.as(Int.self) {
                                  Text("\(intValue) km")
                                    .font(.system(size: 10)) // style it
                                    .foregroundColor(.blue)
                                }
                              }
                          }
                        }
                        .chartXAxisLabel(position: .bottom, alignment: .center) {
                            Text("totalkm: 25000")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                        }
                    }
                
                    List {
                        ForEach(getAllRidesAsCardView(), id:\.ride.title) { card in
                            card
                                .frame(height: geometry.size.height / 4)
                            .listRowBackground(Color(UIColor.tealishBlue))
                            .listRowInsets(EdgeInsets())
                        }
                    }
//                    .background(Color(UIColor.tealishBlue))
//                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
    
    func getAllRidesAsCardView() -> [RideCardView] {
        var cards = [RideCardView]()
        
        for ride in self.manager.allRides {
            let card = RideCardView(ride: ride)
            cards.append(card)
        }
        return cards
    }
}

struct RidesListView_Previews: PreviewProvider {
    static var previews: some View {
        RidesListView(manager: BikeManager())
    }
}

//
//  RidesChartView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 06.06.2023.
//

import SwiftUI
import Charts

struct RidesChartView: View {
    @ObservedObject var manager: BikeManager
    
    var body: some View {
        VStack {
            HStack {
                Image("icon_stats")
                BikeUIText(text: "All Rides Statistics", size: 20, weight: .semibold, color: .white)
                Spacer()
            }
            
            Chart {
                ForEach(BikeType.allCases, id: \.id) { type in
                    BarMark(
                        x: .value("", type.rawValue),
                        y: .value("", manager.getTotalNumberOfDistance(for: type))
                    )
                    .foregroundStyle(Color(type.chartColor))
                    .annotation(position: .overlay, alignment: .bottom) {
                        BikeUIText(text: "\(manager.getTotalNumberOfDistance(for: type))", size: 17, weight: .semibold, color: .black)
                    }
                }
            }
            .chartYScale(domain: [0, manager.getTotalDistanceRidden()])
            .chartYAxis {
                // make sure to always have only 10 lines on the axis if number is higher than a certain threshold
                AxisMarks(values: .automatic(desiredCount: ((manager.getTotalDistanceRidden() % 100) / 10))) {
                    AxisGridLine(stroke: StrokeStyle(lineWidth: 1))
                    AxisTick(stroke: StrokeStyle(lineWidth: 1))
                }
            }
            .chartXAxis {
                AxisMarks { value in
                    AxisValueLabel {
                        switch value.index {
                        case 0:
                            BikeUIText(text: "MTB", size: 17, weight: .regular, color: .greyCloud)
                        case 1:
                            BikeUIText(text: "Road", size: 17, weight: .regular, color: .greyCloud)
                        case 2:
                            BikeUIText(text: "City", size: 17, weight: .regular, color: .greyCloud)
                        case 3:
                            BikeUIText(text: "E-Bike", size: 17, weight: .regular, color: .greyCloud)
                        default:
                            BikeUIText(text: "Unknown", size: 17, weight: .regular, color: .greyCloud)
                        }
                    }
                }
            }
            .chartXAxisLabel(position: .bottom, alignment: .center) {
                BikeUIText(text: "Total: \(manager.getTotalDistanceRidden())\(manager.settings.unit.description)", size: 17, weight: .semibold, color: .white)
            }
        }
        .padding()
    }
}

struct RidesChartView_Previews: PreviewProvider {
    static var previews: some View {
        RidesChartView(manager: BikeManager())
            .background(Color.waikawaGrey)
    }
}

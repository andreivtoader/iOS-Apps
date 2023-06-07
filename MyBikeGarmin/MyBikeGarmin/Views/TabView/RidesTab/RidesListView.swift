//
//  RidesListView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI
import PopupView

struct RidesListView: View {
    @ObservedObject var manager: BikeManager
    
    private let titleConfiguration = PageTitleUIConfiguration(title: "Rides", buttonTitle: "Add Ride", buttonIconTitle: "icon_add", pageType: .rides)
    
    var body: some View {
        ZStack {
            Color.tealishBlue.ignoresSafeArea()
            
            VStack {
                PageTitleView(configuration: titleConfiguration, manager: manager)
                
                Spacer()
                
                RidesChartView(manager: manager)
                
                VStack {
                    List {
                        ForEach(manager.allRides, id: \.id) { ride in
                            RideCardView(manager: manager, ride: ride)
                                .listRowBackground(Color.tealishBlue)
                                .listRowInsets(EdgeInsets())
                        }
                    }
//                    .colorMultiply(Color.tealishBlue)
                    .listStyle(.inset)
                    .background(Color.tealishBlue)
                    .scrollContentBackground(.hidden)
                }
                Spacer()
            }
        }
    }
}

struct RidesListView_Previews: PreviewProvider {
    static var previews: some View {
        RidesListView(manager: BikeManager())
    }
}

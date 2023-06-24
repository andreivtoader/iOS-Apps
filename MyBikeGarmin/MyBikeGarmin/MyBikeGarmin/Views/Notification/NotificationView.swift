//
//  NotificationView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 07.06.2023.
//

import SwiftUI

struct NotificationView: View {
    
    let bikeName: String
    let serviceIn: String
    let units: String
    
    @Binding var isShowing: Bool
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.yellow)
            
            HStack(alignment: .bottom, spacing: 0) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .bottom) {
                        Spacer()
                        Group {
                            BikeUIText(text: bikeName, size: 11, weight: .semibold, color: .black)
                            BikeUIText(text: "service in \(serviceIn)\(units)", size: 11, weight: .regular, color: .black)
                        }
                        Spacer()
                        
                        Button {
                            isShowing = false
                        } label: {
                            Image("icon_x")
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                }
            }
        }
        .frame(height: 100)
        .padding(.horizontal, 16)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(bikeName: "Canyon", serviceIn: "200", units: "km", isShowing: .constant(true))
    }
}

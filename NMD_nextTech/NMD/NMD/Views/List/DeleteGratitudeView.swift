//
//  DeleteGratitudeView.swift
//  NMD
//
//  Created by Andrei Toader on 13.08.2023.
//

import SwiftUI

struct DeleteGratitudeView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: GratitudeVM
    var gratitude: DailyGratitude
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Text("The gratitude entry will be deleted")
                .padding()
            
            HStack(alignment: .center) {
                Button {
                    isShowing = false
                } label: {
                    Text("Cancel")
                }

                Button {
                    //perform delete
                    self.viewModel.delete(entry: gratitude)
                    isShowing = false;
                    dismiss()
                } label: {
                    Text("Delete")
                }
            }
            .padding()
        }
        .padding()
        .background(Color.gray)
        
    }
}

struct DeleteGratitudeView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteGratitudeView(viewModel: GratitudeVM(), gratitude: DailyGratitude(summary: "Cool summary", date: Date.now), isShowing: .constant(true))
    }
}

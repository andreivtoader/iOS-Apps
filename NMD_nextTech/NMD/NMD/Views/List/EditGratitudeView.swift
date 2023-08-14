//
//  EditGratitudeView.swift
//  NMD
//
//  Created by Andrei Toader on 13.08.2023.
//

import SwiftUI

struct EditGratitudeView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: GratitudeVM
    @Binding var gratitude: DailyGratitude
    
    // work on a temporary in case you want to dismiss the changes
    @State private var currentGratitude = DailyGratitude(summary: "", date: Date.now)
    
    var body: some View {
        ScrollView {
            VStack {
                GratitudeFormView(viewModel: viewModel, gratitudeEntry: $currentGratitude)
                
                Button {
                    // update existing value
                    gratitude = currentGratitude
                    dismiss()
                } label: {
                    Text("Update")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 1)
                        }
                        .padding()
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
            .onAppear {
                currentGratitude = gratitude
            }
        }
        
    }
}

struct EditGratitudeView_Previews: PreviewProvider {
    static var previews: some View {
        EditGratitudeView(viewModel: GratitudeVM(), gratitude: .constant(DailyGratitude(summary: "I feel not that great today.", date: Date.now)))
    }
}

//
//  AddGratitudeView.swift
//  NMD
//
//  Created by Andrei Toader on 13.08.2023.
//

import SwiftUI

struct AddGratitudeView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: GratitudeVM

    @State private var gratitude = DailyGratitude(summary: "", date: Date.now)
    
    var body: some View {
        ScrollView {
            VStack {
                ModalTitleView(title: "What are you grateful for today?")
                
                GratitudeFormView(viewModel: viewModel, gratitudeEntry: $gratitude)
                
                Button {
                    self.viewModel.add(entry: gratitude)
                    dismiss()
                } label: {
                    Text("Add")
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
        }
    }
}

struct AddGratitudeView_Previews: PreviewProvider {
    static var previews: some View {
        AddGratitudeView(viewModel: GratitudeVM())
    }
}

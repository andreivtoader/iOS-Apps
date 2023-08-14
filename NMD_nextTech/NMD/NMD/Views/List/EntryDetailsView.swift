//
//  EntryDetails.swift
//  NMD
//
//  Created by Andrei Toader on 13.08.2023.
//

import SwiftUI
import PopupView

struct EntryDetailsView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: GratitudeVM
    @Binding var gratitude: DailyGratitude
    
    @State private var showingDeletePopup = false
    @State private var showingEditScreen = false
    
    var body: some View {
        VStack(spacing: 10) {
            
            DateView(description: gratitude.dateDescription)
            SummaryView(description: gratitude.summary, truncated: false)
            
            if let image = gratitude.image {
                image
                    .resizable()
                    .frame(height: 150)
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                    .padding()
            }
            else if let url = gratitude.imageURL {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .frame(height: 150)
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .padding()
                } placeholder: {
                    ProgressView()
                }
            }
            
            HStack {
                ForEach(gratitude.tags ?? [String](), id: \.self) { tag in
                    TagView(description: tag)
                }
            }
            Spacer()
        }
        .padding()
        .toolbar {
            ToolbarItemGroup {
                Button {
                    showingEditScreen.toggle()
                } label: {
                    Image(systemName: "pencil")
                }
                .sheet(isPresented: $showingEditScreen) {
                    EditGratitudeView(viewModel: viewModel, gratitude: $gratitude)
                }
                
                Button {
                    showingDeletePopup.toggle()
                } label: {
                    Image(systemName: "xmark.bin")
                }
                .popup(isPresented: $showingDeletePopup) {
                    // delete entry popup view
                    VStack(alignment: .center) {
                        Text("The gratitude entry will be deleted")
                            .padding()
                        
                        HStack(alignment: .center) {
                            Button {
                                showingDeletePopup = false
                            } label: {
                                Text("Cancel")
                            }

                            Button {
                                //perform delete
                                self.viewModel.delete(entry: gratitude)
                                showingDeletePopup = false;
                                dismiss()
                            } label: {
                                Text("Delete")
                            }
                        }
                        .padding()
                    }
                    .padding()
                    .background(Color.gray)
                } customize: {
                    $0
                        .isOpaque(true)
                        .closeOnTapOutside(false)
                        .backgroundColor(.black.opacity(0.4))
                }
                
            }
        }
    }
}

struct EntryDetails_Previews: PreviewProvider {
    static var previews: some View {
        EntryDetailsView(viewModel: GratitudeVM(), gratitude: .constant(DailyGratitude(summary: "Nice summary", date: Date.now)))
    }
}

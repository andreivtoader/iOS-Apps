//
//  GratitudeFormView.swift
//  NMD
//
//  Created by Andrei Toader on 13.08.2023.
//

import SwiftUI
import PhotosUI

struct GratitudeFormView: View {
    @ObservedObject var viewModel: GratitudeVM
    @Binding var gratitudeEntry: DailyGratitude
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    @State private var currentTags = [String]()
    @State private var currentInputTag = ""
    
    var body: some View {
        VStack {
            TextField("Summary", text: $gratitudeEntry.summary)
                .multilineTextAlignment(.leading)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 1)
                }
                .padding()
            
            DatePicker("", selection: $gratitudeEntry.date, displayedComponents: .date)
                .padding()
                .datePickerStyle(.wheel)
                .labelsHidden()
                .tint(Color.gray)
            
            PhotosPicker("Select a motivational image.", selection: $avatarItem, matching: .images)

            if let avatarImage {
                avatarImage
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
            }
            
            TextField("Enter tags", text: $currentInputTag) {
                currentTags.append(currentInputTag)
                currentInputTag = ""
            }
            .multilineTextAlignment(.leading)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 1)
            }
            .padding()
            
            HStack {
                ForEach(currentTags, id: \.self) { item in
                    Text(item)
                        .font(.system(size: 16))
                        .padding(.leading, 14)
                        .padding(.trailing, 30)
                        .padding(.vertical, 8)
                        .background(
                            ZStack(alignment: .trailing){
                                Capsule()
                                    .fill(.gray.opacity(0.3))
                                Button{
                                    currentTags.removeAll {$0 == item}
                                } label:{
                                    Image(systemName: "xmark")
                                        .frame(width: 15, height: 15)
                                        .padding(.trailing, 8)
                                        .foregroundColor(.red)
                                }
                            }
                        )
                }
            }
        }
        .onAppear {
            if let existingTags = gratitudeEntry.tags {
                currentTags = existingTags
            }
        }
        .onChange(of: avatarItem) { _ in
            Task {
                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        avatarImage = Image(uiImage: uiImage)
                        
                    }
                }
            }
        }
        .onChange(of: avatarImage) { newImage in
            gratitudeEntry.image = newImage
        }
        .onChange(of: currentTags) { _ in
            gratitudeEntry.tags = currentTags
        }
        
    }
}

struct GratitudeFormView_Previews: PreviewProvider {
    static var previews: some View {
        GratitudeFormView(viewModel: GratitudeVM(), gratitudeEntry: .constant(DailyGratitude(summary: "Grateful for everything", date: Date.now)))
    }
}

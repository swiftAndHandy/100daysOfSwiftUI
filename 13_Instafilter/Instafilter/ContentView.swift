//
//  ContentView.swift
//  Instafilter
//
//  Created by Andre Veltens on 16.11.25.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $pickerItems, matching: .images) {
                Image(systemName: "photo")
                    .font(.largeTitle)
                    .accessibilityLabel("Select an Image")
            }
            
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { index in
                    selectedImages[index]
                        .resizable()
                        .scaledToFit()
                }
            }
            
        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

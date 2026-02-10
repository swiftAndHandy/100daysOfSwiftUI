//
//  EditView.swift
//  BucketList
//
//  Created by Andre Veltens on 07.02.26.
//

import SwiftUI

struct EditView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var vm: ViewModel
    
    var onSave: (Location) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $vm.name)
                    TextField("Description", text: $vm.description)
                }
                
                Section("Nearby…") {
                    switch vm.loadingState {
                    case .loading:
                        Text("Loading…")
                    case .loaded:
                        ForEach(vm.pages, id: \.pageid) { page in
                            Text("\(Text("\(page.title): ").font(.headline))\(Text("\(page.description)").italic())")
                        }
                    case .failed:
                        Text("Loading failed. Please try again.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    onSave(vm.createNewLocation())
                    dismiss()
                }
            }
            .task {
                await vm.fetchNearbyPlaces()
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.onSave = onSave
        _vm = State(initialValue: ViewModel(location: location))
    }
}

#Preview {
    EditView(location: Location.example) { _ in }
}

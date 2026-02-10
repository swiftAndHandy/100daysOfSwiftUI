//
//  ContentView.swift
//  BucketList
//
//  Created by Andre Veltens on 12.12.25.
//

import MapKit
import SwiftUI

struct ContentView: View {
    
    @AppStorage("mapStyle") private var mapStyle: String = "standard"
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.716, longitude: 8.753),
            span: MKCoordinateSpan(latitudeDelta: 0.075, longitudeDelta: 0.075)
        )
    )
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        if viewModel.isUnlocked {
            VStack {
                MapReader { proxy in
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onLongPressGesture(minimumDuration: 0.2) {
                                        viewModel.selectedPlace = location
                                    }
                                
                                
                            }
                        }
                    }
                    .mapStyle(mapStyle == "standard" ?  .standard : .hybrid)
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                    .sheet(item: $viewModel.selectedPlace) { place in
                        EditView(location: place, onSave: {
                            viewModel.updateLocation(location: $0)
                        })
                    }
                }
                
                Picker("Map mode", selection: $mapStyle) {
                    Text("Standard")
                        .tag("standard")
                    Text("Hybrid")
                        .tag("hybrid")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
            }
            
        } else {
            Button("Unlock places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
        }
    }
}

#Preview {
    ContentView()
}

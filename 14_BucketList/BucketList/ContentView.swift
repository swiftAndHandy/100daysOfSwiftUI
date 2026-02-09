//
//  ContentView.swift
//  BucketList
//
//  Created by Andre Veltens on 12.12.25.
//

import MapKit
import SwiftUI

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.716, longitude: 8.753),
            span: MKCoordinateSpan(latitudeDelta: 0.075, longitudeDelta: 0.075)
        )
    )
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
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
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                        viewModel.locations.append(newLocation)
                    }
                }
                .sheet(item: $viewModel.selectedPlace) { place in
                    EditView(location: place, onSave: { newLocation in
                        if let index = viewModel.locations.firstIndex(of: place) {
                            viewModel.locations[index] = newLocation
                        }
                    })
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Andre Veltens on 09.02.26.
//

import Foundation
import MapKit

extension ContentView {
    @Observable
    class ViewModel {
        var locations = [Location]()
        var selectedPlace: Location?
    }
}

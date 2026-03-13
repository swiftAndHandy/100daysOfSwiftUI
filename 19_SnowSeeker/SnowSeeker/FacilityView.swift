//
//  FacilityView.swift
//  SnowSeeker
//
//  Created by Andre Veltens on 13.03.26.
//

import SwiftUI

struct FacilityView: View {
    let facility: String
    
    var body: some View {
            Text(facility)
                .padding(.horizontal)
                .padding(.vertical, 3)
                .background(.blue.opacity(0.2))
                .clipShape(.capsule)
    }
}

#Preview {
    FacilityView(facility: "Family")
}

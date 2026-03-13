//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Andre Veltens on 13.03.26.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    ResortDetailsView(resort: resort)
                    SkiDetailsView(resort: resort)
                }
                .padding(.vertical)
                .background(.primary.opacity(0.1))
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                    
                    Text("Facilities")
                        .font(.headline)
                        .padding(.vertical, 4)
                    
                    Text(resort.facilities, format: .list(type: .and))
                        .padding(.vertical)
                    
//                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
//                        ForEach(resort.facilities, id: \.self) { facility in
//                            FacilityView(facility: facility)
//                        }
//                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
    }
}

#Preview {
    ResortView(resort: .example)
}

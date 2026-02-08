//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Andre Veltens on 30.10.25.
//

import SwiftUI

struct CustomDivider: View {
    let padding: Edge.Set
    let height: Int
    
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(.white.opacity(0.3))
            .padding(padding)
    }
    
    init(_ padding: Edge.Set = .bottom, height: Int = 1) {
        self.padding = padding
        self.height = height
    }
}

#Preview {
        CustomDivider(.top)
}

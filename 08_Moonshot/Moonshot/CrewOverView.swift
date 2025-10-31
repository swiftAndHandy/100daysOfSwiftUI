//
//  CrewOverView.swift
//  Moonshot
//
//  Created by Andre Veltens on 30.10.25.
//

import SwiftUI

struct CrewOverView: View {
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                    .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline.bold())
                                
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.6))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
    
    init(for crew: [MissionView.CrewMember]) {
        self.crew = crew
    }
}

#Preview {
    CrewOverView(for: [])
}

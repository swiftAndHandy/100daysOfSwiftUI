//
//  EditProspectView.swift
//  HotProspects
//
//  Created by Andre Veltens on 20.02.26.
//

import SwiftData
import SwiftUI

struct EditProspectView: View {
    @Bindable var prospect: Prospect
    
    var body: some View {
        Form {
            TextField("Name", text: $prospect.name)
            TextField("Email Address", text: $prospect.emailAddress)
            Toggle("Contacted", isOn: $prospect.isContacted)
        }
        .navigationTitle("Edit Prospect")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Prospect.self, configurations: config)
    let example = Prospect(name: "Example User", emailAddress: "user@example.com", isContacted: false)
    EditProspectView(prospect: example)
        .modelContainer(container)
}

//
//  PoliticianView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 30.08.24.
//

import SwiftUI

struct PoliticianView: View {
    let politician: DataClassPolitician
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(politician.firstName ?? "Kein Name gefunden")
                Text(politician.lastName ?? "Kein Name gefunden")
                Text(politician.party?.label ?? "Keine Partei gefunden")
            }
            .padding()
        }
        .navigationTitle(String(describing: politician.firstName))
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    PoliticianView()
//}

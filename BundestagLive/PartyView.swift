//
//  PartyView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI

struct PartyView: View {
    
    let party: DataClassParty
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(party.fullName ?? "Kein Label")
            }
            .navigationTitle(party.label ?? "Partei")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview {
//    PartyView()
//}

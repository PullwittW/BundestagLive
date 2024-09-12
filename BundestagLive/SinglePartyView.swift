//
//  PartyView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI

struct SinglePartyView: View {
    
    let party: DataClassParty
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                
                VStack {
                    Text(party.fullName ?? "Kein Label")
                }
                .padding()
            }
            .navigationTitle(party.label ?? "Partei")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

//#Preview {
//    PartyView()
//}

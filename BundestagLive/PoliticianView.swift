//
//  PoliticianView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 30.08.24.
//

import SwiftUI

struct PoliticianView: View {
    
    @EnvironmentObject private var politicianVM: PoliticianViewModel
    
    var body: some View {
        VStack {
            Text(politicianVM.politician?.firstName ?? "Kein Name gefunden")
            Text(politicianVM.politician?.lastName ?? "Kein Name gefunden")
            Text(politicianVM.politician?.party?.label ?? "Keine Partei gefunden")
        }
        .padding()
        .onAppear {
            politicianVM.loadPolitician(politicianId: 119742)
        }
    }
}

#Preview {
    PoliticianView()
}

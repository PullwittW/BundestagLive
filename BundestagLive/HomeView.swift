//
//  HomeView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var politiciansVM: PoliticiansViewModel
    @EnvironmentObject private var partysVM: PartysViewModel
    @EnvironmentObject private var fractionsVM: FractionsViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                // Neue Abstimmungen
                
                // Führende Politiker im Spotlight
                
            }
            .navigationTitle("Neues")
            .onAppear {
                if ((politiciansVM.politicians?.isEmpty) != false) {
                    politiciansVM.loadPoliticians()
                }
                if ((partysVM.partys?.isEmpty) != false) {
                    partysVM.loadPartys(searchInput: politiciansVM.searchInput)
                }
                if ((fractionsVM.fractions?.isEmpty) != false) {
                    fractionsVM.loadFractions(searchInput: politiciansVM.searchInput)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

//
//  PoliticainsView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 30.08.24.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject private var politiciansVM: PoliticiansViewModel
    @EnvironmentObject private var partysVM: PartysViewModel
    
    var body: some View {
        NavigationStack {
            // Liste mit allen Suchergebnissen
            List {
                // Sektion für Abgeordnete des Suchergebnisses
                Section {
                    ForEach(politiciansVM.politicians ?? []) { politician in
                        NavigationLink {
                            PoliticianView(politician: politician)
                        } label: {
                            HStack {
                                Text("\(politician.lastName ?? "Kein Nachname"), \(politician.firstName ?? "Kein Vorname")")
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                        }
                    }
                } header: {
                    Text("Politiker")
                }
                
                // Sektion für Partein des Suchergebnisses
                Section {
                    ForEach(partysVM.partys ?? []) { party in
                        NavigationLink {
                            
                        } label: {
                            HStack {
                                Text("\(party.shortName ?? "Kein Name")")
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                        }
                    }
                } header: {
                    Text("Partein")
                }
                
                Section {
                    
                } header: {
                    Text("Fraktionen")
                }

            }
            .navigationTitle("Suche")
            .searchable(text: $politiciansVM.searchInput)
            .onAppear {
                if ((politiciansVM.politicians?.isEmpty) != false) {
                    politiciansVM.loadPoliticians()
                }
                if ((partysVM.partys?.isEmpty) != false) {
                    partysVM.loadPartys()
                }
            }
        }
    }
}

#Preview {
    SearchView()
}

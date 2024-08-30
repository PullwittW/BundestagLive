//
//  PoliticainsView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 30.08.24.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject private var politiciansVM: PoliticiansViewModel
    
    var body: some View {
        NavigationStack {
            // Liste mit allen Suchergebnissen
            List {
                // Sektion für Abgeordnete des Suchergebnisses
                Section {
                    ForEach(politiciansVM.politicians ?? []) { politician in
                        NavigationLink {
                            
                        } label: {
                            HStack {
                                Text("\(politician.lastName ?? "Kein Nachname"), \(politician.firstName ?? "Kein Vorname")")
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(8)
                        }
                    }
                } header: {
                    Text("Politiker")
                }
                
                // Sektion für Partein des Suchergebnisses
                Section {
                    
                } header: {
                    Text("Partein")
                }

            }
            .navigationTitle("Suche")
            .searchable(text: $politiciansVM.searchInput)
            .onAppear {
                politiciansVM.loadPoliticians()
            }
        }
    }
}

#Preview {
    SearchView()
}

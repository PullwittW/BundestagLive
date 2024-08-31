//
//  PoliticainsView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 30.08.24.
//

import SwiftUI
import Combine

struct SearchView: View {
    
    @EnvironmentObject private var politiciansVM: PoliticiansViewModel
    @EnvironmentObject private var partysVM: PartysViewModel
    @EnvironmentObject private var fractionsVM: FractionsViewModel
    @State private var debounceTimer: AnyCancellable? = nil
    
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
                
                // Sektion für Parteien des Suchergebnisses
                Section {
                    ForEach(partysVM.partys ?? []) { party in
                        NavigationLink {
                            PartyView(party: party)
                        } label: {
                            HStack {
                                Text("\(party.label ?? "Kein Name")")
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                        }
                    }
                } header: {
                    Text("Parteien")
                }
                
                Section {
                    ForEach(fractionsVM.fractions ?? []) { fraction in
                        NavigationLink {
                            FractionView()
                        } label: {
                            HStack {
                                Text("\(fraction.label ?? "Kein Name")")
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                        }
                    }
                } header: {
                    Text("Fraktionen")
                }

            }
            .navigationTitle("Suche")
            .navigationBarBackButtonHidden()
            .searchable(text: $politiciansVM.searchInput)
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
            .onChange(of: politiciansVM.searchInput) {
                startDebounceTimer()
            }
        }
    }
    
    private func startDebounceTimer() {
        debounceTimer?.cancel() // Vorherigen Timer abbrechen, falls vorhanden
        
        // Neuen Timer starten, der nach 1 Sekunde den Code ausführt
        debounceTimer = Just(())
            .delay(for: .seconds(0.75), scheduler: RunLoop.main)
            .sink { _ in
                onInputChangeDelayed()
            }
    }
    
    private func onInputChangeDelayed() {
        let trimmedSearch = politiciansVM.searchInput.trimmingCharacters(in: .whitespaces)
        print("Input hat sich seit 1 Sekunde nicht geändert: \(trimmedSearch)")
        politiciansVM.loadPoliticians()
        partysVM.loadPartys(searchInput: trimmedSearch)
        fractionsVM.loadFractions(searchInput: trimmedSearch)
    }
}

#Preview {
    SearchView()
}

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
            ZStack {
                Color.theme.background.ignoresSafeArea()
                
                // Liste mit allen Suchergebnissen
                List {
                    // Sektion für Abgeordnete des Suchergebnisses
                    Section {
                        if politiciansVM.searchInput.count <= 2 {
                            ForEach(politiciansVM.politiciansDefault) { politician in
                                NavigationLink {
                                    SinglePoliticianView(politician: politician)
                                } label: {
                                    HStack {
                                        Text("\(politician.label ?? "Kein Name")")
                                            .foregroundColor(.primary)
                                        Spacer()
                                    }
                                }
                            }
                        } else {
                            ForEach(politiciansVM.politicians ?? []) { politician in
                                NavigationLink {
                                    SinglePoliticianView(politician: politician)
                                } label: {
                                    HStack {
                                        Text(politician.label ?? "Name Abgeordneter")
                                            .foregroundColor(.primary)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    } header: {
                        Text("Politiker")
                    }
                    
                    // Sektion für Parteien des Suchergebnisses
                    Section {
                        if politiciansVM.searchInput.count <= 2 {
                            ForEach(partysVM.partysDefault ?? []) { party in
                                NavigationLink {
                                    SinglePartyView(party: party)
                                } label: {
                                    HStack {
                                        Text("\(party.fullName ?? "Kein Name")")
                                            .foregroundColor(.primary)
                                        Spacer()
                                    }
                                }
                            }
                        } else {
                            ForEach(partysVM.partys ?? []) { party in
                                NavigationLink {
                                    SinglePartyView(party: party)
                                } label: {
                                    HStack {
                                        Text("\(party.fullName ?? "Kein Name")")
                                            .foregroundColor(.primary)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    } header: {
                        Text("Parteien")
                    }
                    
                    Section {
                        ForEach(fractionsVM.fractions ?? []) { fraction in
                            NavigationLink {
                                SingleFractionView(fraction: fraction)
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
            }
            .navigationTitle("Suche")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $politiciansVM.searchInput, placement: .navigationBarDrawer(displayMode: .always), prompt: "Politiker*in, Partei, Fraktion, Nachrichten...")
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

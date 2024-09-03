//
//  ElectionProgrammView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI
import Combine

struct ElectionProgrammView: View {
    
    @EnvironmentObject private var politiciansVM: PoliticiansViewModel
    @EnvironmentObject private var partysVM: PartysViewModel
    @State private var debounceTimer: AnyCancellable? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                
                List {
                    if politiciansVM.searchInput.count <= 2 {
                        ForEach(partysVM.partysDefault ?? []) { party in
                            NavigationLink {
                                PartyProgrammView(party: party)
                            } label: {
                                HStack {
                                    Text("\(party.label ?? "Kein Name")")
                                        .foregroundColor(.primary)
                                    Spacer()
                                }
                            }
                        }
                    } else {
                        ForEach(partysVM.partys ?? []) { party in
                            NavigationLink {
                                PartyProgrammView(party: party)
                            } label: {
                                HStack {
                                    Text("\(party.label ?? "Kein Name")")
                                        .foregroundColor(.primary)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Wahlprogramme")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
            .searchable(text: $politiciansVM.searchInput, placement: .navigationBarDrawer(displayMode: .always), prompt: "Suche nach Parteien")
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
        partysVM.loadPartys(searchInput: trimmedSearch)
    }
}

#Preview {
    ElectionProgrammView()
}

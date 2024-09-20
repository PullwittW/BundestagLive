//
//  Laws.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 17.09.24.

import SwiftUI
import Combine

struct LawsView: View {
    
    @EnvironmentObject private var lawsVM: LawsViewModel
    
    @State private var debounceTimer: AnyCancellable? = nil
    @State private var prefixCounter: Int = 5
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        let lawsList = lawsVM.laws?
                            .filter { $0.beratungsstand?.contains("Überwiesen") == true }
                            .prefix(prefixCounter)
                        
                        ForEach(lawsList ?? []) { law in
                            NavigationLink {
                                LawsDetailView(law: law)
                            } label: {
                                Text(law.titel)
                            }
                        }
                        Button("Mehr laden...") {
                            prefixCounter = prefixCounter + 5
                        }
                    } header: {
                        Text("Verabschiedet")
                    }
                    
                    Section {
                        let lawsList = lawsVM.laws?
                            .filter { $0.beratungsstand?.contains("Noch nicht beraten") == true }
                            .prefix(prefixCounter)
                        
                        ForEach(lawsList ?? []) { law in
                            NavigationLink {
                                LawsDetailView(law: law)
                            } label: {
                                Text(law.titel)
                            }
                        }
                        
                        Button("Mehr laden...") {
                            prefixCounter = prefixCounter + 5
                        }
                    } header: {
                        Text("Vorgeschlagen")
                    }
                }
                .lineLimit(2)
            }
            .navigationTitle("Gesetze")
            .navigationBarTitleDisplayMode(.inline)
            .refreshable {
                lawsVM.loadLaws()
            }
            .searchable(text: $lawsVM.lawsSearchInput, placement: .navigationBarDrawer(displayMode: .always), prompt: "Suche nach Gesetzen")
            .onChange(of: lawsVM.lawsSearchInput) {
                startDebounceTimer()
            }
            .toolbar(.hidden, for: .tabBar)
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
        lawsVM.loadLaws()
    }
}

#Preview {
    LawsView()
}

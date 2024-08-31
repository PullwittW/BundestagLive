//
//  PartysViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import Foundation

@MainActor
class PartysViewModel: ObservableObject {
    @Published var partys: [DataClassParty]?
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadPartys() {
        Task {
            await fetchPartys()
        }
    }
    
    func fetchPartys() async {
        print("LOADING PARTYS")
        guard let url = URL(string: "https://www.abgeordnetenwatch.de/api/v2/parties/?sort_by=full_name&sort_direction=asc&range_start=1&range_end=10") else {
            print("Ungültige Partys URL")
            errorMessage = "Ungültige Partys URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedParty = try JSONDecoder().decode(PartysResult.self, from: data)
            
            self.partys = decodedParty.data
            
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Partys-Daten: \(error)")
        }
        
        isLoading = false
    }
}

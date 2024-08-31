//
//  FractionsViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import Foundation

@MainActor
class FractionsViewModel: ObservableObject {
    @Published var fractions: [DataClassFraction]?
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadFractions(searchInput: String) {
        Task {
            await fetchFractions(searchInput: searchInput)
        }
    }
    
    func fetchFractions(searchInput: String) async {
        print("LOADING FRACTIONS")
        guard let url = URL(string: "https://www.abgeordnetenwatch.de/api/v2/fractions/?label[cn]=\(searchInput)&short_name[cn]=\(searchInput)&sort_by=label&sort_direction=asc&range_start=0&range_end=9") else {
            print("Ungültige Fractions URL")
            errorMessage = "Ungültige Fractions URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedFraction = try JSONDecoder().decode(FractionsResult.self, from: data)
            
            self.fractions = decodedFraction.data
            
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Fractions-Daten: \(error)")
        }
        
        isLoading = false
    }
}

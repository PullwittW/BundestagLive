//
//  FractionViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import Foundation

@MainActor
class FractionViewModel: ObservableObject {
    @Published var fraction: DataClassFraction?
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadFraction(fractionId: Int) {
        Task {
            await fetchFraction(fractionId: fractionId)
        }
    }
    
    func fetchFraction(fractionId: Int) async {
        print("LOADING PARTYS")
        guard let url = URL(string: "https://www.abgeordnetenwatch.de/api/v2/fractions/?") else {
            print("Ungültige Fraction URL")
            errorMessage = "Ungültige Fraction URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedFraction = try JSONDecoder().decode(FractionResult.self, from: data)
            
            self.fraction = decodedFraction.data
            
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Fraction-Daten: \(error)")
        }
        
        isLoading = false
    }
}

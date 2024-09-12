//
//  PoliticianViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 30.08.24.
//
// TEST URL: https://www.abgeordnetenwatch.de/api/v2/politicians/119742

import Foundation

@MainActor
class PoliticianViewModel: ObservableObject {
    @Published var politician: DataClassPolitician?
    @Published var meta: Meta?
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadPolitician(politicianId: Int) {
        Task {
            await fetchPolitician(politicianId: politicianId)
        }
    }
    
    func fetchPolitician(politicianId: Int) async {
        print("LOADING POLITICIAN")
        guard let url = URL(string: "https://www.abgeordnetenwatch.de/api/v2/politicians/\(politicianId)") else {
            print("Ungültige Politician URL")
            errorMessage = "Ungültige Politician URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedPolitician = try JSONDecoder().decode(PoliticianResult.self, from: data)
            
            self.politician = decodedPolitician.data
            self.meta = decodedPolitician.meta
            
//            print("META-DATEN: \(meta.self)")
//            print("-------------------")
            print(politician.self)
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Politician-Daten: \(error)")
        }
        
        isLoading = false
    }
}

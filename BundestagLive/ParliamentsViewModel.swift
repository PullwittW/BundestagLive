//
//  ParliamentsViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 03.09.24.
//

import Foundation

@MainActor
class ParliamentsViewModel: ObservableObject {
    @Published var futureParliaments: [DataClassParliament]?
    @Published var formerParliaments: [DataClassParliament]?
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadFutureParliaments() {
        Task {
            await fetchFutureParliaments()
        }
    }
    
    func loadFormerParliament() {
        Task {
            await fetchFormerParliaments()
        }
    }
    
    func fetchFutureParliaments() async {
        print("LOADING Future Parliaments")
        guard let url = URL(string: "https://www.abgeordnetenwatch.de/api/v2/parliament-periods?type=election&election_date[gte]=2024-09-03&sort_by=election_date&sort_direction=asc") else {
            print("Ungültige Parliaments URL")
            errorMessage = "Ungültige Parliaments URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedParliaments = try JSONDecoder().decode(ParliamentsResult.self, from: data)
            
            self.futureParliaments = decodedParliaments.data
            
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Parliaments-Daten: \(error)")
        }
        
        isLoading = false
    }
    
    func fetchFormerParliaments() async {
        print("LOADING Former Parliaments")
        guard let url = URL(string: "https://www.abgeordnetenwatch.de/api/v2/parliament-periods?type=election&election_date[lte]=2024-09-03&sort_by=election_date&sort_direction=desc&range_end=10") else {
            print("Ungültige Parliaments URL")
            errorMessage = "Ungültige Parliaments URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedParliaments = try JSONDecoder().decode(ParliamentsResult.self, from: data)
            
            self.formerParliaments = decodedParliaments.data
            
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Parliaments-Daten: \(error)")
        }
        
        isLoading = false
    }
}

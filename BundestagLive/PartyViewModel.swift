//
//  PartyViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import Foundation

class PartyViewModel: ObservableObject {
    @Published var party: DataClassParty?
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadParty(partyId: Int) {
        Task {
            await fetchParty(partyId: partyId)
        }
    }
    
    func fetchParty(partyId: Int) async {
        print("LOADING PARTY")
        guard let url = URL(string: "https://www.abgeordnetenwatch.de/api/v2/parties/\(partyId)") else {
            print("Ungültige Party URL")
            errorMessage = "Ungültige Party URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedParty = try JSONDecoder().decode(PartyResult.self, from: data)
            
            self.party = decodedParty.data
            
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Party-Daten: \(error)")
        }
        
        isLoading = false
    }
}

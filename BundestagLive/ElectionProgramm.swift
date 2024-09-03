//
//  ElectionProgramm.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 01.09.24.
//

import Foundation

@MainActor
class ElectionProgramm: ObservableObject {
    @Published var programm: DataClassProgramm?
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadProgramm(partyId: Int) {
        Task {
            await fetchProgramm(partyId: partyId)
        }
    }
    
    func fetchProgramm(partyId: Int) async {
        print("LOADING Programm")
        guard let url = URL(string: "https://www.abgeordnetenwatch.de/api/v2/election-program?party[entity.party.entity.id]=\(partyId)") else {
            print("Ungültige Programm URL")
            errorMessage = "Ungültige Programm URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedProgramm = try JSONDecoder().decode(ProgrammResult.self, from: data)
            
            self.programm = decodedProgramm.data
            
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Programm-Daten: \(error)")
        }
        
        isLoading = false
    }
}

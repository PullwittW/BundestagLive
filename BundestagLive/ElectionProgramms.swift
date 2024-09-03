//
//  ElectionProgramms.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 01.09.24.
// https://www.abgeordnetenwatch.de/api/v2/election-program?party[entity.party.entity.id]=16&range_start=0&range_end=15

import Foundation

@MainActor
class ElectionProgramms: ObservableObject {
    @Published var programms: [DataClassProgramm]?
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadProgramms(partyId: Int) {
        Task {
            await fetchProgramms(partyId: partyId)
        }
    }
    
    func fetchProgramms(partyId: Int) async {
        print("LOADING Programm")
        guard let url = URL(string: "https://www.abgeordnetenwatch.de/api/v2/election-program?party[entity.party.entity.id]=\(partyId)&range_start=0&range_end=15") else {
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
            
            let decodedProgramms = try JSONDecoder().decode(ProgrammsResult.self, from: data)
            
            self.programms = decodedProgramms.data
            
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Programm-Daten: \(error)")
        }
        
        isLoading = false
    }
}

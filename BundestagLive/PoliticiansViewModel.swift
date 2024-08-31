//
//  PoliticiansViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 30.08.24.
// https://www.abgeordnetenwatch.de/api/v2/politicians?label[cn]=Christian Lindner

import Foundation
import SwiftUI

@MainActor
class PoliticiansViewModel: ObservableObject {
    @Published var politicians: [DataClassPolitician]?
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    @Published var searchInput: String = ""
    
    func loadPoliticians() {
        Task {
            await fetchPoliticians()
        }
    }
    
    func fetchPoliticians() async {
        let trimmedSearch = searchInput.trimmingCharacters(in: .whitespaces)
        print("LOADING POLITICIANS")
        guard let url = URL(string: "https://www.abgeordnetenwatch.de/api/v2/politicians?label[cn]=\(trimmedSearch)&sort_by=last_name&sort_direction=asc&range_end=10") else {
            print("Ungültige Politicians URL")
            errorMessage = "Ungültige Politicians URL"
            return
        }
        
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedPolitician = try JSONDecoder().decode(PoliticiansResult.self, from: data)
            
            self.politicians = decodedPolitician.data
            
//            print("META-DATEN: \(meta.self)")
//            print("-------------------")
//            for p in politicians ?? [] {
//                print(p)
//            }
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Politicians-Daten: \(error)")
        }
        
        isLoading = false
    }
}


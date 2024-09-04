//
//  PollViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 01.09.24.
//

import Foundation

@MainActor
class PollViewModel: ObservableObject {
    @Published var poll: DataClassPoll?
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadPoll(pollsId: Int) {
        Task {
            await fetchPolls(pollsId: pollsId)
        }
    }
    
    func fetchPolls(pollsId: Int) async {
        print("LOADING single Poll")
        guard let url = URL(string: "https://www.abgeordnetenwatch.de/api/v2/polls?id=\(pollsId)range_start=0&range_end=15") else {
            print("Ungültige Poll URL")
            errorMessage = "Ungültige Poll URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedPoll = try JSONDecoder().decode(PollResult.self, from: data)
            
            self.poll = decodedPoll.data
            
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Poll-Daten: \(error)")
        }
        
        isLoading = false
    }
}

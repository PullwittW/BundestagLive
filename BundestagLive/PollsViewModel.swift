//
//  PollsViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 01.09.24.
//

import Foundation

@MainActor
class PollsViewModel: ObservableObject {
    @Published var polls: [DataClassPoll]?
    @Published var pollsSearchText: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadPolls(pollsSearchText: String) {
        Task {
            await fetchPolls(pollsSearchText: pollsSearchText)
        }
    }
    
    func fetchPolls(pollsSearchText: String) async {
        print("LOADING Polls")
        guard let url = URL(string: "https://www.abgeordnetenwatch.de/api/v2/polls?label[cn]=\(pollsSearchText)&sort_by=field_poll_date&sort_direction=desc&range_start=0&range_end=10") else {
            print("Ungültige Poll URL")
            errorMessage = "Ungültige Polls URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedPolls = try JSONDecoder().decode(PollsResult.self, from: data)
            
            self.polls = decodedPolls.data
            
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Polls-Daten: \(error)")
        }
        
        isLoading = false
    }
}

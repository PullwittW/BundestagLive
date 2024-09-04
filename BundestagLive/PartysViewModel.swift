//
//  PartysViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//https://www.abgeordnetenwatch.de/api/v2/parties/?id[in]=[16]
//https://www.abgeordnetenwatch.de/api/v2/parties/?label[cn]=BSW&sort_by=full_name&sort_direction=asc&range_start=0&range_end=9

import Foundation

@MainActor
class PartysViewModel: ObservableObject {
    @Published var partysDefault: [DataClassParty]? = [
        DataClassParty(id: Optional(9), entityType: Optional("party"), label: Optional("AfD"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/9"), fullName: Optional("AfD"), shortName: Optional("AfD")),
        DataClassParty(id: Optional(229), entityType: Optional("party"), label: Optional("BSW"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/22"), fullName: Optional("Bündnis Sahra Wagenknecht - Vernunft und Gerechtigkeit"), shortName: Optional("BSW")),
        DataClassParty(id: Optional(8), entityType: Optional("party"), label: Optional("DIE LINKE"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/8"), fullName: Optional("DIE LINKE"), shortName: Optional("DIE LINKE")),
        DataClassParty(id: Optional(16), entityType: Optional("party"), label: Optional("Die PARTEI"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/16"), fullName: Optional("Die PARTEI"), shortName: Optional("Die PARTEI")),
        DataClassParty(id: Optional(6), entityType: Optional("party"), label: Optional("PIRATEN"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/6"), fullName: Optional("PIRATEN"), shortName: Optional("PIRATEN")),
        DataClassParty(id: Optional(5), entityType: Optional("party"), label: Optional("Bündnis 90/Die Grünen"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/5"), fullName: Optional("Bündnis 90/Die Grünen"), shortName: Optional("Bündnis 90/Die Grünen")),
        DataClassParty(id: Optional(4), entityType: Optional("party"), label: Optional("FDP"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/4"), fullName: Optional("FDP"), shortName: Optional("FDP")),
        DataClassParty(id: Optional(3), entityType: Optional("party"), label: Optional("CSU"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/3"), fullName: Optional("CSU"), shortName: Optional("CSU")),
        DataClassParty(id: Optional(2), entityType: Optional("party"), label: Optional("CDU"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/2"), fullName: Optional("CDU"), shortName: Optional("CDU")),
        DataClassParty(id: Optional(1), entityType: Optional("party"), label: Optional("SPD"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/1"), fullName: Optional("SPD"), shortName: Optional("SPD"))
    ]
    @Published var partys: [DataClassParty]?
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadPartys(searchInput: String) {
        Task {
            await fetchPartys(searchInput: searchInput)
        }
    }
    
    func fetchPartys(searchInput: String) async {
        print("LOADING PARTYS")
        guard let url = URL(string: "https://www.abgeordnetenwatch.de/api/v2/parties/?full_name[cn]=\(searchInput)&sort_by=full_name&sort_direction=asc&range_start=0&range_end=9") else {
            print("Ungültige Partys URL")
            errorMessage = "Ungültige Partys URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedParty = try JSONDecoder().decode(PartysResult.self, from: data)
            
            self.partys = decodedParty.data
            
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Partys-Daten: \(error)")
        }
        
        isLoading = false
    }
}

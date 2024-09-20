//
//  LawsViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 17.09.24.
//
//https://search.dip.bundestag.de/api/v1/vorgang?f.vorgangstyp=Gesetzgebung&format=json&apikey=I9FKdCn.hbfefNWCY336dL6x62vfwNKpoN2RZ1gp21
//
// KÜRZLICHE AKTUALIESIERUNG IMPLEMENTIEREN

import Foundation

@MainActor
class LawsViewModel: ObservableObject {
    
    @Published var laws: [Law]? = []
    @Published var lawsSearchInput: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadLaws() {
        Task {
            await fetchLaws()
        }
    }
    
    func fetchLaws() async {
        let trimmedSearch = lawsSearchInput.trimmingCharacters(in: .whitespaces)
        print(trimmedSearch)
        print("LOADING LAWS")
        
        let token = "I9FKdCn.hbfefNWCY336dL6x62vfwNKpoN2RZ1gp21"
        
        guard let url = URL(string: "https://search.dip.bundestag.de/api/v1/vorgang?f.titel=\(trimmedSearch)&f.vorgangstyp=Gesetzgebung&format=json&apikey=\(token)") else {
            print("Ungültige Laws URL")
            errorMessage = "Ungültige Laws URL"
            return
        }
        let defaultURL = URL(string: "https://search.dip.bundestag.de/api/v1/vorgang?f.vorgangstyp=Gesetzgebung&format=json&apikey=\(token)")

        
        isLoading = true
        errorMessage = nil
        
        if trimmedSearch.count == 0 {
            do {
                let (data, response) = try await URLSession.shared.data(from: defaultURL!)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                let decodedLaws = try JSONDecoder().decode(LawResult.self, from: data)
                
                self.laws = decodedLaws.documents
                

            } catch {
                errorMessage = "Fehler: \(error.localizedDescription)"
                print("Fehler beim Abrufen der Laws-Daten: \(error)")
            }
        } else {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                let decodedLaws = try JSONDecoder().decode(LawResult.self, from: data)
                
                self.laws = decodedLaws.documents
                

            } catch {
                errorMessage = "Fehler: \(error.localizedDescription)"
                print("Fehler beim Abrufen der Laws-Daten: \(error)")
            }
        }
    }
    
    func filterLaws(searchText: String) -> [Law] {
        if searchText.isEmpty {
            return laws ?? []
                } else {
                    return laws?.filter {
                        $0.titel.contains(searchText)
                    } ?? []
                }
    }
}

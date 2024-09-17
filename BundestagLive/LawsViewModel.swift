//
//  LawsViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 17.09.24.
//
// URL: https://search.dip.bundestag.de/api/v1/vorgang?f.metatyp=Gesetze&f.format=json&apikey=rgsaY4U.oZRQKUHdJhF9qguHMkwCGIoLaqEcaHjYLF
// https://search.dip.bundestag.de/api/v1/vorgang?f.vorgangstyp=Gesetzgebung&format=json&apikey=rgsaY4U.oZRQKUHdJhF9qguHMkwCGIoLaqEcaHjYLF
// https://search.dip.bundestag.de/api/v1/vorgang?f.titel=GesetzzudemÃœbereinkommenvom12.MÃ¤rz2019zurGrÃ¼ndungdes\"SquareKilometreArray\"-Observatoriums&f.vorgangstyp=Gesetzgebung&format=json&apikey=rgsaY4U.oZRQKUHdJhF9qguHMkwCGIoLaqEcaHjYLF


import Foundation

@MainActor
class NewsViewModel: ObservableObject {
    
    @Published var news: [News]? = []
//    @Published var singleNews: [News] = []
    
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadNews() {
        Task {
            await fetchNews()
        }
    }
    
    func fetchNews() async {
        print("LOADING NEWS")
        let token = "I9FKdCn.hbfefNWCY336dL6x62vfwNKpoN2RZ1gp21"
        guard let url = URL(string: "https://search.dip.bundestag.de/api/v1/vorgang?f.vorgangstyp=Gesetzgebung&format=json&apikey=\(token)") else {
            print("Ungültige News URL")
            errorMessage = "Ungültige News URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedNews = try JSONDecoder().decode(NewsResult.self, from: data)
            
            self.news = decodedNews.documents
            

        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der News-Daten: \(error)")
        }
    }
    
//    func loadSpecificNews(titel: String) async throws {
//        print("LOADING NEWS")
//        let token = "rgsaY4U.oZRQKUHdJhF9qguHMkwCGIoLaqEcaHjYLF"
//        guard let url = URL(string: "https://search.dip.bundestag.de/api/v1/vorgang/f.titel=\(titel)?f.vorgangstyp=Gesetzgebung&format=json&apikey=\(token)") else { return }
//        Task {
//            do {
//                let (data, response) = try await URLSession.shared.data(from: url)
//                if 200..<300 ~= (response as? HTTPURLResponse)?.statusCode ?? 0 {
//                    print("SUCCESS LOADING NEWS")
//                } else {
//                    print(response)
//                }
//                let newsResult = try JSONDecoder().decode(NewsResult.self, from: data)
//                singleNews.self = newsResult.documents ?? []
//                print("News Count: \(self.news.count)")
//                
//            } catch {
//                print(error)
//            }
//        }
//    }
//    
//    func formattedDate(dateString: String) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd" // Das Eingabeformat
//        if let date = dateFormatter.date(from: dateString) {
//            dateFormatter.dateFormat = "dd.MM.yyyy" // Das Ausgabeformat
//            return dateFormatter.string(from: date)
//        } else {
//            return "Ungültiges Datum"
//        }
//    }
    
    func filterNews(searchText: String) -> [News] {
        if searchText.isEmpty {
            return news ?? []
                } else {
                    return news?.filter {
                        $0.titel.contains(searchText)
                    } ?? []
                }
    }
}

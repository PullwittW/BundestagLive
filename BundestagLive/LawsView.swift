//
//  Laws.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 17.09.24.
//if news.beratungsstand ?? "Kein Beratungszustand" == "Überwiesen" {
//VStack {
//    Text(news.titel)
//}
//}

import SwiftUI
import Combine

struct LawsView: View {
    
    @EnvironmentObject private var newsVM: NewsViewModel
    @State private var debounceTimer: AnyCancellable? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        if let newsList = newsVM.news {
                            ForEach(newsList.prefix(50).filter { $0.beratungsstand?.contains("Überwiesen") == true }) { news in
                                NavigationLink {
                                    LawsDetailView(news: news)
                                } label: {
                                    Text(news.titel)
                                }
                            }
                        }
                    } header: {
                        Text("Verabschiedet")
                    }
                    
                    Section {
                        if let newsList = newsVM.news {
                            ForEach(newsList.prefix(50).filter { $0.beratungsstand?.contains("Noch nicht beraten") == true }) { news in
                                NavigationLink {
                                    LawsDetailView(news: news)
                                } label: {
                                    Text(news.titel)
                                }
                            }
                        }
                    } header: {
                        Text("Vorgeschlagen")
                    }
                }
                .lineLimit(2)
            }
            .navigationTitle("Gesetze")
            .navigationBarTitleDisplayMode(.inline)
            .refreshable {
                newsVM.loadNews()
            }
            .searchable(text: $newsVM.newsSearchInput, placement: .navigationBarDrawer(displayMode: .always), prompt: "Suche nach Gesetzen")
            .onChange(of: newsVM.newsSearchInput) {
                startDebounceTimer()
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
    
    private func startDebounceTimer() {
        debounceTimer?.cancel() // Vorherigen Timer abbrechen, falls vorhanden
        
        // Neuen Timer starten, der nach 1 Sekunde den Code ausführt
        debounceTimer = Just(())
            .delay(for: .seconds(0.75), scheduler: RunLoop.main)
            .sink { _ in
                onInputChangeDelayed()
            }
    }
    
    private func onInputChangeDelayed() {
        newsVM.loadNews()
    }
}

#Preview {
    LawsView()
}

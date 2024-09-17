//
//  Laws.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 17.09.24.
//

import SwiftUI

struct LawsView: View {
    
    @EnvironmentObject private var newsVM: NewsViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        ForEach(newsVM.news?.prefix(5) ?? []) { news in
                            if news.beratungsstand ?? "Kein Beratungszustand" == "Überwiesen" {
                                VStack {
                                    Text(news.titel)
                                }
                            }
                        }
                    } header: {
                        Text("Verabschiedet")
                    }
                    
                    Section {
                        ForEach(newsVM.news?.prefix(5) ?? []) { news in
                            if news.beratungsstand ?? "Kein Beratungszustand" == "Noch nicht beraten" {
                                VStack {
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
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    LawsView()
}

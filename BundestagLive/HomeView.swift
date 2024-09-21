//
//  HomeView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var politiciansVM: PoliticiansViewModel
    @EnvironmentObject private var pollsVM: PollsViewModel
    @EnvironmentObject private var parliamentsVM: ParliamentsViewModel
    @EnvironmentObject private var newsVM: TagesschauViewModel
    
    @State private var count: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                ScrollView {
                    // Aktuellen Bundestag abbilden
                    
                    
                    // Bevorstehende Wahlen
                    if parliamentsVM.futureParliaments?.isEmpty ?? true {
                        VStack {
                            ProgressView()
                        }
                        .padding()
                    } else {
                        VStack(spacing: 0) {
                            HStack {
                                Text("Bevorstehende Wahlen")
                                    .foregroundStyle(Color.theme.sectonTextColor)
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(parliamentsVM.futureParliaments ?? []) { parliament in
                                        SingleNextElectionView(parliament: parliament)
                                            .frame(height: 70)
                                            .padding(.trailing, 10)
                                            .padding(.vertical, 10)
                                    }
                                }
                                .padding(.bottom, 5)
                            }
                        }
                    }
                    
                    // Aktuelle Abstimmungen
                    HStack {
                        Text("Aktuelle Abstimmungen")
                            .foregroundStyle(Color.theme.sectonTextColor)
                            .font(.callout)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    if pollsVM.polls?.isEmpty ?? true {
                        VStack {
                            ProgressView()
                        }
                        .padding()
                    } else {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(pollsVM.polls?.prefix(5) ?? []) { poll in
                                    NavigationLink {
                                        PollDetailView(poll: poll)
                                    } label: {
                                        singlePoll(poll: poll)
                                            .frame(width: 200, height: 150)
                                            .padding(.trailing, 10)
                                            .padding(.vertical, 10)
                                    }
                                }
                            }
                        }
                    }
                    
                    // Neuste Nachrichten von der Tagesschau Inland
                    HStack {
                        Text("Nachrichten aus dem Inland")
                            .foregroundStyle(Color.theme.sectonTextColor)
                            .font(.callout)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        ForEach(newsVM.news.prefix(5)) { news in
                            NavigationLink {
                                NewsDetailView(news: news)
                            } label: {
                                SingleNewsView(news: news)
                                    .padding(.vertical, 5)
                            }
                        }
                    }
                    .padding(.trailing)
                    
                    // Politiker im Spotlight
                    HStack {
                        Text("Politiker im Spotlight")
                            .foregroundStyle(Color.theme.sectonTextColor)
                            .font(.callout)
                            .fontWeight(.semibold)
                        Spacer()
                    }
//                    VStack {
//                        if let politician = politiciansVM.politicians?.randomElement() {
//                            NavigationLink {
//                                SinglePoliticianView(politician: politician)
//                            } label: {
//                                Text(politician.label!)
//                            }
//                        }
//                    }
                    
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
            }
            .navigationTitle("Neues")
            .refreshable {
                newsVM.loadNews()
            }
        }
    }
}

#Preview {
    HomeView()
}

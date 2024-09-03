//
//  HomeView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var politiciansVM: PoliticiansViewModel
    @EnvironmentObject private var partysVM: PartysViewModel
    @EnvironmentObject private var fractionsVM: FractionsViewModel
    @EnvironmentObject private var pollsVM: PollsViewModel
    
    @State private var count: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                VStack(spacing: 0) {
                    // wenn next elections = true
                    HStack {
                        Text("Bevorstehende Wahlen")
                            .foregroundStyle(Color.theme.sectonTextColor)
                        Spacer()
                    }
                    
                    // Aktuelle Abstimmungen
                    HStack {
                        Text("Aktuelle Abstimmungen")
                            .foregroundStyle(Color.theme.sectonTextColor)
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
                                ForEach(pollsVM.polls ?? []) { poll in
                                    singlePoll(poll: poll)
                                        .frame(width: 200, height: 150)
                                        .padding(10)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
            }
            .navigationTitle("Neues")
            .onAppear {
                if ((politiciansVM.politicians?.isEmpty) != false) {
                    politiciansVM.loadPoliticians()
                }
                if ((partysVM.partys?.isEmpty) != false) {
                    partysVM.loadPartys(searchInput: politiciansVM.searchInput)
                }
                if ((fractionsVM.fractions?.isEmpty) != false) {
                    fractionsVM.loadFractions(searchInput: politiciansVM.searchInput)
                }
                pollsVM.loadPolls(pollsSearchText: "")
            }
        }
    }
}

#Preview {
    HomeView()
}

//
//  LaunchView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 14.09.24.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject private var politiciansVM: PoliticiansViewModel
    @EnvironmentObject private var partysVM: PartysViewModel
    @EnvironmentObject private var fractionsVM: FractionsViewModel
    @EnvironmentObject private var pollsVM: PollsViewModel
    @EnvironmentObject private var parliamentsVM: ParliamentsViewModel
    @EnvironmentObject private var surveysVM: SurveysViewModel
    @EnvironmentObject private var newsVM: NewsViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.launchColor.ignoresSafeArea()
                Image("launchImage")
                    .resizable()
                    .frame(width: 350, height: 350)
                
                VStack(alignment: .leading) {
                    Text("Bundestag")
                    Text("Live.")
                }
                .font(.system(size: 40))
                .fontWeight(.bold)
                .offset(x: -30, y: 10)
                
            }
            .toolbar(.hidden, for: .tabBar)
            .onAppear {
//                if ((politiciansVM.politicians?.isEmpty) != false) {
//                    politiciansVM.loadPoliticians()
//                }
//                if ((partysVM.partys?.isEmpty) != false) {
//                    partysVM.loadPartys(searchInput: politiciansVM.searchInput)
//                }
//                if ((fractionsVM.fractions?.isEmpty) != false) {
//                    fractionsVM.loadFractions(searchInput: politiciansVM.searchInput)
//                }
                if ((pollsVM.polls?.isEmpty) != false) {
                    pollsVM.loadPolls(pollsSearchText: pollsVM.pollsSearchText)
                }
                if ((parliamentsVM.futureParliaments?.isEmpty) != false) {
                    parliamentsVM.loadFutureParliaments()
                }
//                if ((parliamentsVM.formerParliaments?.isEmpty) != false) {
//                    parliamentsVM.loadFormerParliament()
//                }
//                if ((surveysVM.surveys?.isEmpty) != false) {
//                    surveysVM.loadSurveys()
//                }
            }
        }
    }
}

#Preview {
    LaunchView()
}

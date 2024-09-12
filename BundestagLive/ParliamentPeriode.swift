//
//  ParliamentPeriode.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI

struct ParliamentPeriode: View {
    
    @EnvironmentObject private var politiciansVM: PoliticiansViewModel
    @EnvironmentObject private var partysVM: PartysViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(.bundestagSilhouette)
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                List {
                    NavigationLink {
                        SinglePoliticianView(politician: politiciansVM.politiciansDefault[9])
                    } label: {
                        VStack(alignment: .leading) {
                            Text("Bundespräsident: ")
                            Text("Frank-Walter Steinmeier (SPD)")
                                .foregroundStyle(Color.theme.accent)
                        }
                    }
                    NavigationLink {
                        SinglePoliticianView(politician: politiciansVM.politiciansDefault[8])
                    } label: {
                        VStack(alignment: .leading) {
                            Text("Bundeskanzler: ")
                            Text("Olaf Scholz (SPD)")
                                .foregroundStyle(Color.theme.accent)
                        }
                    }
                    NavigationLink {
                        SinglePoliticianView(politician: politiciansVM.politiciansDefault[1])
                    } label: {
                        VStack(alignment: .leading) {
                            Text("Bundestagspräsidentin: ")
                            Text("Bärbel Bas (SPD)")
                                .foregroundStyle(Color.theme.accent)
                        }
                    }
                    Section {
                        NavigationLink {
                            SinglePartyView(party: partysVM.partysDefault![9])
                        } label: {
                            Text("SPD")
                                .foregroundStyle(Color.theme.accent)
                        }
                        NavigationLink {
                            SinglePartyView(party: partysVM.partysDefault![5])
                        } label: {
                            Text("Bündnis 90/Die Grünen")
                                .foregroundStyle(Color.theme.accent)
                        }
                        NavigationLink {
                            SinglePartyView(party: partysVM.partysDefault![6])
                        } label: {
                            Text("FDP")
                                .foregroundStyle(Color.theme.accent)
                        }
                        
                    } header: {
                        Text("Koalition - 'Ampel'")
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Das Parlament")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    ParliamentPeriode()
}

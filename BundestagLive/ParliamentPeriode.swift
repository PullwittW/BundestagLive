//
//  ParliamentPeriode.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI

struct ParliamentPeriode: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(.bundestagSilhouette)
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                List {
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Text("Bundeskanzler: ")
                            + Text("Olaf Scholz (SPD)")
                                .foregroundStyle(Color.theme.accent)
                        }
                    }
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Text("Bundestagspräsidentin: ")
                            + Text("Bärbel Bas (SPD)")
                                .foregroundStyle(Color.theme.accent)
                        }
                    }
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Text("Koalition: ")
                            + Text("SPD")
                                .foregroundStyle(Color.theme.accent)
                            + Text(" , ")
                            + Text("Bündnis90/Die Grünen")
                                .foregroundStyle(Color.theme.accent)
                            + Text(" , ")
                            + Text("FDP")
                                .foregroundStyle(Color.theme.accent)
                        }
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

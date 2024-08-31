//
//  MoreView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    // Parlamentarische Perioden
                    Section {
                        NavigationLink {
                            
                        } label: {
                            Text("Parlamentarische Periode")
                        }
                    } header: {
                        Text("Das Parlament")
                    }
                    
                    // Wahlprogramme, bevorstehende Wahlen, Wahlrecht/-ablauf
                    Section {
                        // Navigation Link zu den Wahlprogrammen der Partein
                        NavigationLink {
                            ElectionProgrammView()
                        } label: {
                            Text("Wahlprogramme")
                        }
                        
                        // Bevorstehende Wahlen
                        NavigationLink {
                            NextElectionView()
                        } label: {
                            Text("Bevorstehende Wahlen")
                        }
                        
                        // Alle Infos zum Wahlrecht und Wahlablauf
                        NavigationLink {
                            
                        } label: {
                            Text("Wahlrecht und Wahlablauf")
                        }
                    } header: {
                        Text("Wahlen")
                    }
                    
                    // Datenquelle(n) und rechtliche Hinweise
                    Section {
                        NavigationLink {
                            
                        } label: {
                            Text("Datasources")
                        }
                    } header: {
                        Text("Rechtliches")
                    }
                }
            }
            .navigationTitle("Mehr")
        }
    }
}

#Preview {
    MoreView()
}

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
            ZStack {
                Color.theme.background.ignoresSafeArea()
                
                VStack {
                    List {
                        // Parlamentarische Perioden
                        Section {
                            NavigationLink {
                                ParliamentPeriode()
                            } label: {
                                Text("Periode")
                            }
                            NavigationLink {
                                LawsView()
                            } label: {
                                Text("Gesetze und Gesetzesvorschläge")
                            }
                        } header: {
                            Text("Bundestag")
                        }
                        
                        // Wahlprogramme, bevorstehende Wahlen, Wahlrecht/-ablauf
                        Section {
                            // Navigation Link zu den Wahlprogrammen der Parteien
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
                            
                            // Vergangene Wahlen
                            NavigationLink {
                                PreviousElections()
                            } label: {
                                Text("Vergangene Wahlen")
                            }
                            
                            // Alle Infos zum Wahlrecht und Wahlablauf
                            NavigationLink {
                                ElectionRight()
                            } label: {
                                Text("Wahlrecht und Wahlablauf")
                            }
                        } header: {
                            Text("Wahlen")
                        }
                        
                        // Datenquelle(n) und rechtliche Hinweise
                        Section {
                            NavigationLink {
                                Resources()
                            } label: {
                                Text("Datasources")
                            }
                            
                            NavigationLink {
                                Legals()
                            } label: {
                                Text("Datenhauftungsausschluss")
                            }
                        } header: {
                            Text("Daten und Rechtliches")
                        }
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

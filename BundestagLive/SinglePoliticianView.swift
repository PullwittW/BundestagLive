//
//  PoliticianView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 30.08.24.
//

import SwiftUI

struct SinglePoliticianView: View {
    @Environment(\.dismiss) private var dismiss
    let politician: DataClassPolitician
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                    
                VStack {
                    HStack {
                        NavigationLink {
                            
                        } label: {
                            Text(politician.party?.label ?? "Es konnte keine Partei geladen werden")
                                .font(.title2)
                                .bold()
                                .padding()
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(Color.theme.sectonTextColor)
                    }
                    .padding(.bottom)
                    
                    // Aktueller Beruf
                    VStack {
                        HStack {
                            Text("Aktueller Beruf")
                                .foregroundStyle(Color.theme.sectonTextColor)
                            Spacer()
                        }
                        HStack {
                            Text(politician.occupation ?? "Es konnte kein Beruf geladen werden")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.leading)
                                .background {
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundStyle(Color.theme.sectonTextColor)
                                }
                        }
                    }
                    .padding(.bottom)
                    
                    // Bildung
                    VStack {
                        HStack {
                            Text("Bildung")
                                .foregroundStyle(Color.theme.sectonTextColor)
                            Spacer()
                        }
                        HStack {
                            Text(politician.education ?? "Es konnte keine Bildung geladen werden")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(Color.theme.sectonTextColor)
                        }
                    }
                    .padding(.bottom)

                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle("\(politician.label ?? "Politiker")")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    SinglePoliticianView(politician: DataClassPolitician.examplePolitician)
}

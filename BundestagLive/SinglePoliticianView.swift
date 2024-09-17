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
                
                ScrollView {
                    HStack {
                        Rectangle()
                            .foregroundStyle(Color.theme.accent)
                            .frame(width: 3)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Partei:")
                                    .foregroundStyle(Color.theme.sectonTextColor)
                                NavigationLink {
                                    
                                } label: {
                                    Text(politician.party?.label ?? "Es konnte keine Partei geladen werden")
                                }

                            }
                            
                            Text("Beruf: ")
                                .foregroundStyle(Color.theme.sectonTextColor)
                            + Text(politician.occupation ?? "Es konnte kein Beruf geladen werden")
                            Text("Qualifikation: ")
                                .foregroundStyle(Color.theme.sectonTextColor)
                            + Text(politician.education ?? "Es konnte keine Bildung geladen werden")
                        }
                        .font(.callout)
                        .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.vertical)
                    Divider()
                        .padding(.horizontal)
                    Spacer()
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .padding(.horizontal)
                }
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

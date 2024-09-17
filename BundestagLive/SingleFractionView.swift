//
//  FractionView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI

struct SingleFractionView: View {
    
    @Environment(\.dismiss) private var dismiss
    let fraction: DataClassFraction
    
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
                            Text("Partei: ")
                                .foregroundStyle(Color.theme.sectonTextColor)
                            + Text(fraction.fullName ?? "Es konnte kein Parteiname gefunden werden")
                            Text("Parlament: ")
                                .foregroundStyle(Color.theme.sectonTextColor)
                            + Text(fraction.legislature?.label ?? "Es konnte kein Parlament gefunden werden")
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
            .toolbar(.hidden, for: .tabBar)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview {
//    SingleFractionView()
//}

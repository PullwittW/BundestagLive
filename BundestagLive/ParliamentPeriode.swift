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

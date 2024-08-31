//
//  NextElectionView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI

struct NextElectionView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("Bevorstehende Wahlen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    NextElectionView()
}

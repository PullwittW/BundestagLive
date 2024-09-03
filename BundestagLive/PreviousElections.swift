//
//  PreviousElections.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 03.09.24.
//

import SwiftUI

struct PreviousElections: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                
                
            }
            .navigationTitle("Vergangene Wahlen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    PreviousElections()
}

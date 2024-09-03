//
//  Resources.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI

struct Resources: View {
    var body: some View {
        NavigationStack {
            List {
                Text("www.abgeordnetenwatch.de")
                Text("www.bpb.de")
                
            }
            .navigationTitle("Datasources")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
            .foregroundStyle(Color.theme.sectonTextColor)
        }
    }
}

#Preview {
    Resources()
}

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
                Section {
                    Text("www.abgeordnetenwatch.de")
                    Text("www.bpb.de")
                }
                Section {
                    Text("www.dawum.de")
                    HStack {
                        Text("Lizenz von ODC-ODbL: ")
                        + Text("https://opendatacommons.org/licenses/odbl/1-0/")
                    }
                }
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

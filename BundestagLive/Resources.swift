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
                Section("EU-Parlament, Bundestag und Landtage") {
                    Text("[Abgeornetenwatch](www.abgeordnetenwatch.de)")
                    Text("[Bundeszentrale für polititsche Bildung | BPB](www.bpb.de)")
                    Text("[DIP Bundestag](https://dip.bundestag.de/über-dip/hilfe/api#content)")
                }
                Section("Wahlprognosen") {
                    Text("[Dawum](www.dawum.de)")
                    Text("[Lizenz von ODC-ODbL](https://opendatacommons.org/licenses/odbl/1-0/)")
                }
                Section("Argumente gegen Populismus") {
                    Text("[MiaThinkX zu Populismus](www.populismus.online)")
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

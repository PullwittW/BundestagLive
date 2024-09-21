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
                    Text("[Abgeordnetenwatch](https://abgeordnetenwatch.de)")
                    Text("[Bundeszentrale für polititsche Bildung | BPB](https://bpb.de)")
                    Text("[DIP Bundestag](https://dip.bundestag.de/über-dip/hilfe/api#content)")
                }
                Section("Nachrichten") {
                    Text("[Tagesschau](https://tagesschau.de)")
                    Text("[Bund API-Portal](https://bund.dev)")
                }
                Section("Wahlprognosen") {
                    Text("[Dawum API](https://dawum.de)")
                    Text("[Lizenz von ODC-ODbL](https://opendatacommons.org/licenses/odbl/1-0/)")
                }
                Section("Argumente gegen Populismus") {
                    Text("[MiaThinkX zu Populismus](https://populismus.online)")
                    Text("[Lage der Nation 'Talk' - Erste Hilfe gegen Desinformation](https://talk.lagedernation.org/c/faq-desinformation/14)")
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

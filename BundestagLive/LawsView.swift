//
//  Laws.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 17.09.24.
//

import SwiftUI

struct LawsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        
                    } header: {
                        Text("Verabschiedet")
                    }
                    
                    Section {
                        
                    } header: {
                        Text("Vorgeschlagen")
                    }
                }
            }
            .navigationTitle("Gesetze")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    LawsView()
}

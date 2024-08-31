//
//  BundestagLiveApp.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 30.08.24.
//

import SwiftUI

@main
struct BundestagLiveApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView(selectedTab: 0)
                .preferredColorScheme(.light)
                .environmentObject(PoliticiansViewModel())
                .environmentObject(PartysViewModel())
                .environmentObject(FractionsViewModel())
        }
    }
}

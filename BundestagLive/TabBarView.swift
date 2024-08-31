//
//  TabView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI

struct TabBarView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Neues")
                }
                .tag(0)
            
            SearchView()
                .tabItem {
                    Image(systemName: "doc.text.magnifyingglass")
                    Text("Suchen")
                }
                .tag(1)
            
            PollsView()
                .tabItem {
                    Image(systemName: "menucard")
                    Text("Abstimmungen")
                }
                .tag(2)
            
            MoreView()
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("Mehr")
                }
                .tag(3)
        }
        .sensoryFeedback(.selection, trigger: selectedTab)
    }
}

#Preview {
    TabBarView()
}

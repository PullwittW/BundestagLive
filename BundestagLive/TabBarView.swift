//
//  TabView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            if selectedTab == 0 {
                LaunchView()
                    .tag(0)
            } else {
                HomeView()
                    .tabItem {
                        Image(systemName: "newspaper")
                        Text("Neues")
                    }
                    .tag(1)
                
                SearchView()
                    .tabItem {
                        Image(systemName: "doc.text.magnifyingglass")
                        Text("Suchen")
                    }
                    .tag(2)
                
                PollsView()
                    .tabItem {
                        Image(systemName: "chart.bar.doc.horizontal") // doc.questionmark, list.clipboard, doc.plaintext
                        Text("Abstimmungen")
                    }
                    .tag(3)
                
                MoreView()
                    .tabItem {
                        Image(systemName: "ellipsis")
                        Text("Mehr")
                    }
                    .tag(4)
                    .environmentObject(NewsViewModel())
            }
        }
        .sensoryFeedback(.selection, trigger: selectedTab)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                if networkManager.isConnected {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        selectedTab = 1
                    }
                }
            }
        }
        .alert("Du bist nicht mit dem Internet verbunden", isPresented: Binding(
            get: { !networkManager.isConnected },
            set: { networkManager.isConnected = !$0 }
        )) {
            Button("Öffne Einstellungen") {
                // Get the settings URL and open it
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url)
                }
            }
        }
    }
}

#Preview {
    TabBarView()
}

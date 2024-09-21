//
//  NewsDetailView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 21.09.24.
//

import SwiftUI

struct NewsDetailView: View {
    
    let news: News
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    NewsDetailView(news: .newsExample)
}

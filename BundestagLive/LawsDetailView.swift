//
//  LawsDetailView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 17.09.24.
//

import SwiftUI

struct LawsDetailView: View {
    
    let news: News
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text(news.titel)
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                    
                    HStack {
                        Rectangle()
                            .foregroundStyle(Color.theme.accent)
                            .frame(width: 3)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Initiative:")
                                    .foregroundStyle(Color.theme.sectonTextColor)
                                ForEach(news.initiative ?? [], id: \.self) { news in
                                    Text(news)
                                }
                            }
                            HStack {
                                ForEach(news.sachgebiet ?? [], id: \.self) { gebiet in
                                    Text(gebiet)
                                        .foregroundStyle(Color.theme.sectonTextColor)
                                }
                            }
                        }
                        .font(.callout)
                        .bold()
                        
                        Spacer()
                    }
                    
                    Divider()
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text(HTMLFormatter().htmlToPlainText(news.abstract ?? "Kein Inhalt verfügbar"))
                            .lineSpacing(2.0)
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
        }
    }
}

//#Preview {
//    LawsDetailView()
//}

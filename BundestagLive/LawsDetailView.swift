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
        VStack {
            Text(news.titel)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
            
            HStack(spacing: 10) {
                Rectangle()
                    .foregroundStyle(Color.theme.accent)
                    .frame(width: 3)
                VStack(alignment: .leading) {
                    ForEach(news.initiative ?? [], id: \.self) { news in
                        Text(news)
                            .foregroundStyle(Color("TextColor"))
                    }
                    if let beratungszustand = news.beratungsstand {
                        Text("Beratungsstand: " + beratungszustand)
                            .foregroundStyle(Color("TextColor"))
                    }
                }
                .font(.callout)
                .bold()
                
                Spacer()
            }
            
            Divider()
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text(HTMLFormatter().htmlToPlainText(news.abstract ?? "Kein Inhalt verfügbar"))
                    .lineSpacing(2.0)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
            }
        }
    }
}

//#Preview {
//    LawsDetailView()
//}

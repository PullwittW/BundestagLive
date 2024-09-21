//
//  SingleNewsView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 20.09.24.
//

import SwiftUI

struct SingleNewsView: View {

    let news: News
    
    var body: some View {
        HStack {
            let url = news.teaserImage.imageVariants?["1x1-840"]
            
            AsyncImage(url: URL(string: url ?? "https://placehold.co/600x400")) { phase in
                switch phase {
                case .failure:
                    AsyncImage(url: URL(string: "https://placehold.co/600x400")!)
                case .success(let image):
                    image
                        .resizable()
                        
                default:
                    ProgressView()
                }
            }
            .frame(width: 150)
            
            VStack(alignment: .leading) {
                Text(news.title ?? "Titel")
                    .font(.headline)
                    .bold()
                    .foregroundStyle(Color.black)
                Text(news.firstSentence ?? "Erste Sätze")
                    .font(.footnote)
                    .bold()
                    .foregroundStyle(Color.theme.sectonTextColor)
                Spacer()
            }
            .multilineTextAlignment(.leading)
            .padding(.trailing, 5)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(5)
        .frame(height: 150)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color.white)
                
        }
    }
}

#Preview {
    SingleNewsView(news: .newsExample)
}

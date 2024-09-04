//
//  PollsDetailView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 02.09.24.
//

import SwiftUI

struct PollDetailView: View {
    
    var poll: DataClassPoll
    @State private var pollDescription: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack {
                        Text("\(poll.label ?? "Beschreibung")")
                            .multilineTextAlignment(.center)
                        Text("vom \(DateFormatter.dateFormatter.convertDateFormat(from: poll.fieldPollDate ?? "01.01.2025") ?? "01.01.2025")")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.theme.textColor)
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(poll.fieldAccepted ?? false ? Color.green : Color.red)
                            
                    }
                    
                    Text(pollDescription)
                        .padding()
                        .foregroundStyle(Color.theme.textColor)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(Color.theme.background)
                        }
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .toolbar(.hidden, for: .tabBar)
            .onAppear {
                pollDescription = String.htmlStringFormatter.htmlToPlainText(poll.fieldIntro ?? "<h1>Willkommen</h1><p>Dies ist ein <b>Beispiel</b> für ein Intro-Text.</p>")
            }
        }
    }
}

//#Preview {
//    PollsDetailView()
//}

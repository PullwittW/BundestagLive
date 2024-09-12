//
//  PollsDetailView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 02.09.24.
//

import SwiftUI

struct PollDetailView: View {
    
    @Environment(\.openURL) var openURL
    
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
                    
                    VStack {
                        HStack {
                            Text("Beschreibung")
                                .foregroundStyle(Color.theme.sectonTextColor)
                            Spacer()
                        }

                        Text(pollDescription)
                            .padding()
                            .foregroundStyle(Color.theme.textColor)
                            .background {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(Color.theme.background)
                            }
                    }
                    .padding(.top)
                    
                    VStack {
                        HStack {
                            Text("Weiterführende Links")
                                .foregroundStyle(Color.theme.sectonTextColor)
                            Spacer()
                        }

                        ForEach(poll.fieldRelatedLinks ?? [], id: \.self) { link in
                            HStack {
                                Text("\(link.title ?? "www.wangupullwitt.de")")
                                    .padding()
                                    .foregroundStyle(Color.theme.accent)
                                Spacer()
                            }
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .background {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(Color.theme.background)
                            }
                            .onTapGesture {
                                openURL(URL(string: link.uri ?? "www.wangupullwitt.de")!)
                            }
                        }
                    }
                    .padding(.top)
                    Spacer()
                }
                .padding(.horizontal)
            }
            .navigationTitle(poll.fieldLegislature?.label ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
            .onAppear {
                pollDescription = String.htmlStringFormatter.htmlToPlainText(poll.fieldIntro ?? "<h1>Willkommen</h1><p>Dies ist ein <b>Beispiel</b> für ein Intro-Text.</p>")
                print(poll.fieldRelatedLinks?.first?.uri ?? "")
            }
            .handleOpenURLInApp()
        }
    }
}

//#Preview {
//    PollsDetailView()
//}

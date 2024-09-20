//
//  LawsDetailView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 17.09.24.
//

import SwiftUI

struct LawsDetailView: View {
    
    let law: Law
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text(law.titel)
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                    
                    HStack {
                        Rectangle()
                            .foregroundStyle(Color.theme.accent)
                            .frame(width: 3)
                        VStack(alignment: .leading) {
                            Text("Datum: ")
                                .foregroundStyle(Color.theme.sectonTextColor)
                            + Text(DateConverter().convertDateFormat(from: law.datum ?? "2000-01-01")!)
                            HStack {
                                Text("Initiative:")
                                    .foregroundStyle(Color.theme.sectonTextColor)
                                ForEach(law.initiative ?? [], id: \.self) { law in
                                    Text(law)
                                }
                            }
                            HStack {
                                ForEach(law.sachgebiet ?? [], id: \.self) { gebiet in
                                    Text(gebiet)
                                        .foregroundStyle(Color.theme.sectonTextColor)
                                }
                            }
                        }
                        .font(.callout)
                        .bold()
                        
                        Spacer()
                    }
                    .padding(.vertical)
                    
                    Divider()
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text(HTMLFormatter().htmlToPlainText(law.abstract ?? "Kein Inhalt verfügbar"))
                            .lineSpacing(2.0)
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                    }
                    .padding()
                    
                    if !(law.verkuendung ?? []).isEmpty {
                        VStack {
                            HStack {
                                Text("Weiterführende Links")
                                    .foregroundStyle(Color.theme.sectonTextColor)
                                Spacer()
                            }
                            ForEach(law.verkuendung ?? []) { verkuendung in
                                HStack {
                                    Text(verkuendung.pdfURL)
                                        .padding()
                                        .foregroundStyle(Color.theme.accent)
                                }
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity)
                                .background {
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundStyle(Color.theme.background)
                                }
                            }
                        }
                        .padding()
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

//#Preview {
//    LawsDetailView()
//}

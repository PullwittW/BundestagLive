//
//  PartyProgrammView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 01.09.24.
//

import SwiftUI
import WebKit

struct PartyProgrammView: View {
    
    let party: DataClassParty
    @EnvironmentObject private var programmsVM: ElectionProgramms
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                
                List {
                    ForEach(programmsVM.programms ?? []) { programm in
                        NavigationLink {
                            WebView(url: URL(string: programm.file ?? "www.wangupullwitt.de")!)
                                .ignoresSafeArea()
                        } label: {
                            Text("\(programm.parliamentPeriod?.label ?? "Parlamentarische Periode")")
                        }

                    }
                }
            }
            .navigationTitle(party.fullName ?? "Partei")
            .onAppear {
                programmsVM.loadProgramms(partyId: party.id ?? 1)
            }
        }
    }
    
    private func openPDFInSafari(pdfURL: URL) {
        if UIApplication.shared.canOpenURL(pdfURL) {
            UIApplication.shared.open(pdfURL, options: [:], completionHandler: nil)
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

//#Preview {
//    PartyProgrammView()
//}

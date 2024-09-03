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
                VStack {
                    Text(pollDescription)
                        .lineLimit(3)
                    Text(poll.fieldPollDate ?? "01.01.2024")
                    
                    Spacer()
                }
                .padding()
            }
            .onAppear {
                pollDescription = htmlToPlainText(poll.fieldIntro ?? "<h1>Willkommen</h1><p>Dies ist ein <b>Beispiel</b> für HTML-Text in <i>SwiftUI</i>.</p>")
            }
        }
    }
    
    private func htmlToPlainText(_ html: String) -> String {
        // Versuchen, den HTML-Text als NSAttributedString zu initialisieren
        guard let data = html.data(using: .utf8) else { return html } // Falls die Konvertierung fehlschlägt, Original-HTML-String zurückgeben
        do {
            // Konvertieren von HTML in NSAttributedString
            let attributedString = try NSAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue],
                documentAttributes: nil
            )
            // Rückgabe des reinen Textes ohne HTML-Tags
            return attributedString.string
        } catch {
            // Im Fehlerfall Original-HTML-String zurückgeben
            print("Fehler beim Parsen von HTML: \(error)")
            return html
        }
    }
}

//#Preview {
//    PollsDetailView()
//}

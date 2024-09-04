//
//  Formatter.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 03.09.24.
//

import Foundation

extension DateFormatter {
    static let dateFormatter = DateConverter()
}

struct DateConverter {
    func convertDateFormat(from inputDate: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd" // Format des Eingabedatums

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd.MM.yyyy" // Gewünschtes Ausgabeformat

        if let date = inputFormatter.date(from: inputDate) {
            return outputFormatter.string(from: date)
        } else {
            return nil // Fehlerbehandlung, falls das Eingabedatum ungültig ist
        }
    }
}

extension String {
    static let htmlStringFormatter = HTMLFormatter()
}

struct HTMLFormatter {
    func htmlToPlainText(_ html: String) -> String {
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

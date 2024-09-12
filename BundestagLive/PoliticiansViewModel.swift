//
//  PoliticiansViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 30.08.24.
// 118987, 79316, 119742, 139064, 78886, 79455, 66924, 79475, 108379, 135391
// https://www.abgeordnetenwatch.de/api/v2/politicians?id[in]=[118987, 79316, 119742, 139064, 78886, 79455, 66924, 79475, 108379, 135391]&sort_by=last_name&sort_direction=asc&range_end=10

import Foundation
import SwiftUI

@MainActor
class PoliticiansViewModel: ObservableObject {
    @Published var politiciansDefault: [DataClassPolitician] = [
        DataClassPolitician(id: Optional(79475), entityType: Optional("politician"), label: Optional("Annalena Baerbock"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/politicians/79475"), abgeordnetenwatchURL: Optional("https://www.abgeordnetenwatch.de/profile/annalena-baerbock"), firstName: Optional("Annalena"), lastName: Optional("Baerbock"), birthName: nil, sex: Optional("f"), yearOfBirth: Optional(1980), party: Optional(BundestagLive.Party(id: 5, entityType: Optional("party"), label: Optional("Bündnis 90/Die Grünen"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/5"))), partyPast: nil, education: Optional("Völkerrechtlerin (LL.M.)"), residence: Optional("Potsdam"), occupation: Optional("Bundesministerin des Auswärtigen, MdB"), statisticQuestions: Optional(571), statisticQuestionsAnswered: nil, extIDBundestagsverwaltung: Optional("1775"), qidWikidata: Optional("Q564328"), fieldTitle: nil),
        DataClassPolitician(id: Optional(79455), entityType: Optional("politician"), label: Optional("Bärbel Bas"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/politicians/79455"), abgeordnetenwatchURL: Optional("https://www.abgeordnetenwatch.de/profile/baerbel-bas"), firstName: Optional("Bärbel"), lastName: Optional("Bas"), birthName: nil, sex: Optional("f"), yearOfBirth: Optional(1968), party: Optional(BundestagLive.Party(id: 1, entityType: Optional("party"), label: Optional("SPD"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/1"))), partyPast: nil, education: Optional("Personalmanagement-Ökonomin"), residence: nil, occupation: Optional("MdB"), statisticQuestions: Optional(388), statisticQuestionsAnswered: Optional(386), extIDBundestagsverwaltung: Optional("1607"), qidWikidata: Optional("Q1019016"), fieldTitle: nil),
        DataClassPolitician(id: Optional(118987), entityType: Optional("politician"), label: Optional("Marco Buschmann"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/politicians/118987"), abgeordnetenwatchURL: Optional("https://www.abgeordnetenwatch.de/profile/marco-buschmann"), firstName: Optional("Marco"), lastName: Optional("Buschmann"), birthName: nil, sex: Optional("m"), yearOfBirth: Optional(1977), party: Optional(BundestagLive.Party(id: 4, entityType: Optional("party"), label: Optional("FDP"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/4"))), partyPast: nil, education: Optional("Rechtsanwalt"), residence: nil, occupation: Optional("Bundesminister der Justiz, MdB"), statisticQuestions: Optional(1204), statisticQuestionsAnswered: Optional(1146), extIDBundestagsverwaltung: Optional("1661"), qidWikidata: Optional("Q1893672"), fieldTitle: nil),
        DataClassPolitician(id: Optional(135391), entityType: Optional("politician"), label: Optional("Nancy Faeser"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/politicians/135391"), abgeordnetenwatchURL: Optional("https://www.abgeordnetenwatch.de/profile/nancy-faeser"), firstName: Optional("Nancy"), lastName: Optional("Faeser"), birthName: nil, sex: Optional("f"), yearOfBirth: Optional(1970), party: Optional(BundestagLive.Party(id: 1, entityType: Optional("party"), label: Optional("SPD"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/1"))), partyPast: nil, education: nil, residence: nil, occupation: nil, statisticQuestions: Optional(10), statisticQuestionsAnswered: nil, extIDBundestagsverwaltung: nil, qidWikidata: nil, fieldTitle: nil),
        DataClassPolitician(id: Optional(139064), entityType: Optional("politician"), label: Optional("Robert Habeck"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/politicians/139064"), abgeordnetenwatchURL: Optional("https://www.abgeordnetenwatch.de/profile/robert-habeck"), firstName: Optional("Robert"), lastName: Optional("Habeck"), birthName: nil, sex: Optional("m"), yearOfBirth: Optional(1969), party: Optional(BundestagLive.Party(id: 5, entityType: Optional("party"), label: Optional("Bündnis 90/Die Grünen"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/5"))), partyPast: nil, education: Optional("Philosoph, Schriftsteller"), residence: Optional("Flensburg "), occupation: Optional("Bundesminister für Wirtschaft und Klimaschutz, MdB"), statisticQuestions: Optional(1278), statisticQuestionsAnswered: Optional(525), extIDBundestagsverwaltung: Optional("2387"), qidWikidata: Optional("Q109943"), fieldTitle: nil),
        DataClassPolitician(id: Optional(79316), entityType: Optional("politician"), label: Optional("Hubertus Heil"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/politicians/79316"), abgeordnetenwatchURL: Optional("https://www.abgeordnetenwatch.de/profile/hubertus-heil"), firstName: Optional("Hubertus"), lastName: Optional("Heil"), birthName: nil, sex: Optional("m"), yearOfBirth: Optional(1972), party: Optional(BundestagLive.Party(id: 1, entityType: Optional("party"), label: Optional("SPD"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/1"))), partyPast: nil, education: Optional("Politikwissenschaftler"), residence: nil, occupation: Optional("Bundesminister für Arbeit und Soziales, MdB"), statisticQuestions: Optional(931), statisticQuestionsAnswered: Optional(833), extIDBundestagsverwaltung: Optional("1030"), qidWikidata: Optional("Q71534"), fieldTitle: nil),
        DataClassPolitician(id: Optional(119742), entityType: Optional("politician"), label: Optional("Christian Lindner"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/politicians/119742"), abgeordnetenwatchURL: Optional("https://www.abgeordnetenwatch.de/profile/christian-lindner"), firstName: Optional("Christian"), lastName: Optional("Lindner"), birthName: nil, sex: Optional("m"), yearOfBirth: Optional(1979), party: Optional(BundestagLive.Party(id: 4, entityType: Optional("party"), label: Optional("FDP"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/4"))), partyPast: nil, education: Optional("Politikwissenschaften, Staatsrecht und Philosophie"), residence: nil, occupation: Optional("Bundesminister der Finanzen, MdB, FDP-Parteivorsitzender"), statisticQuestions: Optional(1914), statisticQuestionsAnswered: Optional(641), extIDBundestagsverwaltung: Optional("2163"), qidWikidata: Optional("Q85806"), fieldTitle: nil),
        DataClassPolitician(id: Optional(66924), entityType: Optional("politician"), label: Optional("Olaf Scholz"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/politicians/66924"), abgeordnetenwatchURL: Optional("https://www.abgeordnetenwatch.de/profile/olaf-scholz"), firstName: Optional("Olaf"), lastName: Optional("Scholz"), birthName: nil, sex: Optional("m"), yearOfBirth: Optional(1958), party: Optional(BundestagLive.Party(id: 1, entityType: Optional("party"), label: Optional("SPD"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/1"))), partyPast: nil, education: Optional("Rechtsanwalt"), residence: Optional("Potsdam"), occupation: Optional("Bundeskanzler der Bundesrepublik Deutschland, MdB"), statisticQuestions: Optional(557), statisticQuestionsAnswered: nil, extIDBundestagsverwaltung: Optional("2531"), qidWikidata: Optional("Q61053"), fieldTitle: nil),
        DataClassPolitician(id: Optional(78980), entityType: Optional("politician"), label: Optional("Frank-Walter Steinmeier"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/politicians/78980"), abgeordnetenwatchURL: Optional("https://www.abgeordnetenwatch.de/profile/frank-walter-steinmeier"), firstName: Optional("Frank-Walter"), lastName: Optional("Steinmeier"), birthName: nil, sex: Optional("m"), yearOfBirth: Optional(1956), party: Optional(BundestagLive.Party(id: 1, entityType: Optional("party"), label: Optional("SPD"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/1"))), partyPast: nil, education: Optional("Jurist"), residence: nil, occupation: Optional("Mitglied des Bundestages"), statisticQuestions: nil, statisticQuestionsAnswered: nil, extIDBundestagsverwaltung: nil, qidWikidata: Optional("Q76658"), fieldTitle: nil),
        DataClassPolitician(id: Optional(108379), entityType: Optional("politician"), label: Optional("Alice Weidel"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/politicians/108379"), abgeordnetenwatchURL: Optional("https://www.abgeordnetenwatch.de/profile/alice-weidel"), firstName: Optional("Alice"), lastName: Optional("Weidel"), birthName: nil, sex: Optional("f"), yearOfBirth: Optional(1979), party: Optional(BundestagLive.Party(id: 9, entityType: Optional("party"), label: Optional("AfD"), apiURL: Optional("https://www.abgeordnetenwatch.de/api/v2/parties/9"))), partyPast: nil, education: Optional("Volkswirtin"), residence: nil, occupation: Optional("MdB, Fraktionsvorsitzende AfD im Bundestag"), statisticQuestions: Optional(175), statisticQuestionsAnswered: nil, extIDBundestagsverwaltung: Optional("2277"), qidWikidata: Optional("Q27975838"), fieldTitle: nil)
    ]
    @Published var politicians: [DataClassPolitician]?
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    @Published var searchInput: String = ""
    @Published var noInternetPolitician: Bool = false
    
    @State private var defaultURL = URL(string: "https://www.abgeordnetenwatch.de/api/v2/politicians?id[in]=[118987, 79316, 119742, 139064, 78886, 79455, 66924, 79475, 108379, 135391]&sort_by=last_name&sort_direction=asc&range_end=10")
    
    func loadPoliticians() {
        Task {
            await fetchPoliticians()
        }
    }
    
    func fetchPoliticians() async {
        let trimmedSearch = searchInput.trimmingCharacters(in: .whitespaces)
        print("LOADING POLITICIANS")
        guard let url = URL(string: "https://www.abgeordnetenwatch.de/api/v2/politicians?label[cn]=\(trimmedSearch)&sort_by=last_name&sort_direction=asc&range_end=10") else {
            print("Ungültige Politicians URL")
            errorMessage = "Ungültige Politicians URL"
            return
        }

        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedPolitician = try JSONDecoder().decode(PoliticiansResult.self, from: data)
            
            self.politicians = decodedPolitician.data
            
//            print("META-DATEN: \(meta.self)")
//            print("-------------------")
//            for p in politicians ?? [] {
//                print(p)
//            }
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Politicians-Daten: \(error)")
            if error.localizedDescription.contains("offline") || error.localizedDescription.contains("SSL") {
                print("KEINE INTERNETVERBINDUNG")
                noInternetPolitician = true
            }
        }
        
        isLoading = false
    }
}


//
//  Legal.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 01.09.24.
//

import SwiftUI

struct Legals: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                ScrollView {
                    VStack {
                        Text("Die in dieser App bereitgestellten Informationen und Daten werden 'wie sie sind' zur Verfügung gestellt und dienen ausschließlich allgemeinen Informationszwecken. Wir übernehmen keine Gewähr für die Richtigkeit, Vollständigkeit, Verfügbarkeit oder Aktualität der in der App bereitgestellten Daten. Insbesondere wird keine Haftung für etwaige Fehler, Auslassungen oder Ungenauigkeiten in den dargestellten Informationen übernommen. ")
                        Text("")
                        Text("Die App kann auf Daten und Inhalte zugreifen, die von Dritten bereitgestellt werden. Wir sind nicht verantwortlich für die Richtigkeit, Aktualität oder Verfügbarkeit dieser externen Informationen und übernehmen keine Haftung für Schäden oder Verluste, die durch das Vertrauen auf die bereitgestellten Informationen entstehen.")
                        Text("")
                        Text("Die Nutzer dieser App sollten eigenverantwortlich und unabhängig die bereitgestellten Informationen prüfen und keine Entscheidungen ausschließlich auf Basis der in der App dargestellten Daten treffen. Für rechtliche, finanzielle, medizinische oder andere Entscheidungen, die eine fachkundige Beratung erfordern, empfehlen wir, sich an entsprechende Experten zu wenden.")
                        Text("")
                        Text("Durch die Nutzung dieser App erklären Sie sich damit einverstanden, dass die Entwickler und Betreiber der App nicht für eventuelle Schäden oder Verluste haftbar gemacht werden können, die direkt oder indirekt durch die Nutzung oder das Vertrauen auf die in der App bereitgestellten Informationen entstehen.")
                        Spacer()
                        Text("")
                        Text("Kontakt:")
                        Text("www.wangupullwitt.de/bundestag-live")
                    }
                    .padding(.horizontal)

                }
                .foregroundStyle(Color.theme.sectonTextColor)
                .padding(.vertical)
            }
            .navigationTitle("Datenhauftungsausschluss")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    Legals()
}

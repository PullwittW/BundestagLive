//
//  NextElectionDetailsView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 08.09.24.
//

import SwiftUI
import Charts

struct NextElectionDetailsView: View {
    
    @EnvironmentObject private var surveysVM: SurveysViewModel
    let parliament: DataClassParliament
    
    @State private var parliamentId: String = ""
    @State private var bundestag: Bool = false
    @State private var europa: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                
                ScrollView {
                    HStack {
                        Rectangle()
                            .foregroundStyle(Color.theme.accent)
                            .frame(width: 3)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Was wird gewählt:")
                                    .foregroundStyle(Color.theme.sectonTextColor)
                                if bundestag {
                                    Text("Es wird der Bundestag gewählt")
                                } else if europa {
                                    Text("Es wird das EU-Parlament gewählt")
                                } else {
                                    Text("Landtag in \(parliament.parliament?.label ?? "")")
                                }
                            }
                            
                            Text("Wann wird gewählt:")
                                .foregroundStyle(Color.theme.sectonTextColor)
                            + Text(DateConverter().convertDateFormat(from: parliament.electionDate ?? "2000-01-01")!)
                            
                        }
                        .font(.callout)
                        .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.vertical)
                    
                    Divider()
                        .padding(.horizontal)
                    
                    // aktuelle Wahlumfragen
                    let filteredSurveys = Array(surveysVM.surveys!.values
                        .sorted(by: { $0.date ?? "" > $1.date ?? "" })
                        .filter { $0.parliamentID == parliamentId }
                        .prefix(1)) // Begrenzung auf das erste gefilterte Element
                    
                    ForEach(filteredSurveys, id: \.id) { survey in // Neuste Umfrage zum betrefenden Land
                        VStack(alignment: .leading) {
                            if let instituteId = survey.instituteID {
                                Text("Umfrageinstitut: ")
                                    .foregroundStyle(Color.theme.sectonTextColor)
                                + Text(surveysVM.getInstituteName(instituteId: instituteId))
                            }
                            
                            if let surveyPeriod = survey.surveyPeriod {
                                if let dateStart = surveyPeriod.dateStart, let dateEnd = surveyPeriod.dateEnd {
                                    Text("Umfragenzeitraum: ")
                                        .foregroundStyle(Color.theme.sectonTextColor)
                                    + Text(DateConverter().convertDateFormat(from: dateStart)!)
                                    + Text(" - ")
                                    + Text(DateConverter().convertDateFormat(from: dateEnd)!)
                                }
                            }
                            
                            if let surveyedPersons = survey.surveyedPersons {
                                Text("Befragte Personen: ")
                                    .foregroundStyle(Color.theme.sectonTextColor)
                                + Text(surveyedPersons)
                            }
                            
                            if let results = survey.results {
                                Chart {
                                    ForEach(results.keys.sorted(by: { (key1, key2) in
                                        let percentage1 = results[key1] ?? 0.0
                                        let percentage2 = results[key2] ?? 0.0
                                        return percentage1 > percentage2
                                    }), id: \.self) { key in
                                        if let percentage = results[key] {
                                            BarMark(
                                                x: .value("Party", surveysVM.getPartyName(partyId: key)),  // X-Axis: Partei
                                                y: .value("Percentage", percentage)                         // Y-Axis: Prozentangabe
                                            )
                                            .foregroundStyle(surveysVM.getPartyColor(partyId: key))
                                            .annotation(position: .top) {
                                                Text("\(percentage, specifier: "%.1f")")
                                            }
                                        }
                                    }
                                }
                                .chartYAxisLabel("Prozent")   // Optional: Add a Y-axis label
                                .chartXAxisLabel("Partei")            // Optional: Add an X-axis label
                                .frame(height: 300)
                            }
                            Divider()
                            
//                          Zusammenstellung möglicher Regierungskoalitionen
//                            Text("Mögliche Regierungskoalitionen:")
//                                .foregroundStyle(Color.theme.sectonTextColor)
//                                .font(.callout)
//                                .fontWeight(.semibold)
                        }
                        .font(.callout)
                        .fontWeight(.semibold)
                        
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            .onAppear {
                self.parliamentId = surveysVM.getSurveyId(surveyLand: parliament.parliament?.label ?? "Bundestag")
                if parliament.parliament?.label == "Bundestag" {
                    bundestag = true
                } else if parliament.parliament?.label == "EU-Parlament" {
                    europa = true
                }
                print(self.parliamentId)
            }
            .toolbar(.hidden, for: .tabBar)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview {
//    NextElectionDetailsView()
//}

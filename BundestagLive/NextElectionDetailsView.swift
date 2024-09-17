//
//  NextElectionDetailsView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 08.09.24.
//

import SwiftUI

struct NextElectionDetailsView: View {
    
    @EnvironmentObject private var surveysVM: SurveysViewModel
    let parliament: DataClassParliament
    
    @State private var parliamentId: String = "0"
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
                            
                            Text("Wann wird gewählt: ")
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
                    Spacer()
                }
            }
            .onAppear {
                self.parliamentId = surveysVM.getSurveyId(surveyLand: parliament.label ?? "Bundestag")
                if parliament.parliament?.label == "Bundestag" {
                    bundestag = true
                } else if parliament.parliament?.label == "EU-Parlament" {
                    europa = true
                }
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

//#Preview {
//    NextElectionDetailsView()
//}

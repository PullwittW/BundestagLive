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
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .onAppear {
                self.parliamentId = surveysVM.getSurveyId(surveyLand: parliament.label ?? "Bundestag")
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

//#Preview {
//    NextElectionDetailsView()
//}

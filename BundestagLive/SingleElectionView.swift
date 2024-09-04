//
//  SingleElectionsView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 04.09.24.
//

import SwiftUI

struct SingleElectionView: View {
    
    let nextParliament: DataClassParliament
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(Color.theme.accent)
            
            VStack {
                Text("\(nextParliament.parliament?.label ?? "Bevorstehende Wahl")") // Wahl
                    .font(.title2)
                    .bold()
                    .foregroundStyle(Color.theme.textColor)
                Text(DateFormatter.dateFormatter.convertDateFormat(from: nextParliament.electionDate ?? "2025-01-01")!)
                    .foregroundStyle(Color.theme.sectonTextColor)
                    .bold()
            }
            .padding()
        }
    }
}

//#Preview {
//    SingleElectionView()
//}

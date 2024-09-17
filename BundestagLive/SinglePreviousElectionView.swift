//
//  SinglePreviousElectionView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 17.09.24.
//

import SwiftUI

struct SinglePreviousElectionView: View {
    
    let parliament: DataClassParliament
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                PreviousElectionDetailView(parliament: parliament)
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .strokeBorder(style: StrokeStyle(lineWidth: 3))
                    
                    VStack {
                        Spacer()
                        Text("\(parliament.parliament?.label ?? "Vergangene Wahl")") // Wahl
                            .font(.title2)
                            .bold()
                            .foregroundStyle(Color.theme.textColor)
                            .padding(.horizontal)
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.theme.accent)
                                .frame(height: 40)
                                .frame(maxWidth: .infinity)
                            
                            Text(DateFormatter.dateFormatter.convertDateFormat(from: parliament.electionDate ?? "2025-01-01")!)
                                .bold()
                                .foregroundStyle(Color.white)
                        }
                        .padding(5)
                    }
                }
            }
        }
    }
}

//#Preview {
//    SinglePreviousElectionView()
//}

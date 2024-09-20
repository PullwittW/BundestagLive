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
                    
                    HStack(spacing: 2) {
                        
                        Image(parliament.parliament?.label ?? "Vergangene Wahl")
                            .resizable()
                            .scaledToFit()
                            .padding(.vertical, 8)
                            .padding(.leading, 8)
                        
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.theme.accent)
                                .frame(maxWidth: .infinity)
                                .padding(5)
                            
                            VStack {
                                Text("\(parliament.parliament?.label ?? "Vergangene Wahl")") // Wahl
                                    .font(.title3)
                                    .bold()
                                    .foregroundStyle(Color.theme.textColor)
                                    .padding(.horizontal)
                                
                                Text(DateFormatter.dateFormatter.convertDateFormat(from: parliament.electionDate ?? "2025-01-01")!)
                                    .bold()
                                    .font(.callout)
                                    .fontWeight(.semibold).foregroundStyle(Color.white)
                            }
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    SinglePreviousElectionView()
//}

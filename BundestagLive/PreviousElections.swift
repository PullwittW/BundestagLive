//
//  PreviousElections.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 03.09.24.
//

import SwiftUI

struct PreviousElections: View {
    
    @EnvironmentObject private var parliamentsVM: ParliamentsViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                
                if parliamentsVM.formerParliaments?.isEmpty ?? true {
                    VStack {
                        ProgressView()
                    }
                    .padding()
                } else {
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(parliamentsVM.formerParliaments ?? []) { parliament in
                                SinglePreviousElectionView(parliament: parliament)
                                    .padding(.bottom, 10)
                                    .frame(height: 130)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Vergangene Wahlen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
            .refreshable {
                parliamentsVM.loadFormerParliament()
            }
        }
    }
}

#Preview {
    PreviousElections()
}

//
//  NextElectionView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import SwiftUI

struct NextElectionView: View {
    
    @EnvironmentObject private var parliamentsVM: ParliamentsViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                ScrollView {
                    if parliamentsVM.futureParliaments?.isEmpty ?? true {
                        VStack {
                            ProgressView()
                        }
                        .padding()
                    } else {
                        ScrollView() {
                            VStack {
                                ForEach(parliamentsVM.futureParliaments ?? []) { parliament in
                                    SingleNextElectionView(parliament: parliament)
                                        .padding(.bottom, 10)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationTitle("Bevorstehende Wahlen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
            .refreshable {
                parliamentsVM.loadFutureParliaments()
            }
        }
    }
}

#Preview {
    NextElectionView()
}

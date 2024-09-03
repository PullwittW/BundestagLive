//
//  SingleElectionProgrammView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 01.09.24.
//

import SwiftUI

struct SingleElectionProgrammView: View {
    
    let programm: DataClassProgramm
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                
                VStack {
                    Text(programm.file ?? "Kein Programm verfügbar")
                }
            }
        }
    }
}

//#Preview {
//    SingleElectionProgrammView()
//}

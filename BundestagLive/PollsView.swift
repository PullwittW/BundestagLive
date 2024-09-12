//
//  PollsView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 30.08.24.
//

import SwiftUI
import Combine

struct PollsView: View {
    @EnvironmentObject private var pollsVM: PollsViewModel
    @State private var debounceTimer: AnyCancellable? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(pollsVM.polls ?? []) { poll in
                            NavigationLink {
                                PollDetailView(poll: poll)
                            } label: {
                                singlePoll(poll: poll)
                                    .padding(.horizontal)
                                    .padding(.bottom, 10)
                            }
                        }
                    }
                }
                .padding(.top, 10)
            }
            .navigationTitle("Abstimmungen")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $pollsVM.pollsSearchText,placement: .navigationBarDrawer(displayMode: .always), prompt: "Suche nach Abstimmungen...")
            .onAppear {
                if ((pollsVM.polls?.isEmpty) != false) {
                    pollsVM.loadPolls(pollsSearchText: pollsVM.pollsSearchText)
                }
            }
            .onChange(of: pollsVM.pollsSearchText) {
                startDebounceTimer()
            }
        }
    }
    
    func startDebounceTimer() {
        debounceTimer?.cancel() // Vorherigen Timer abbrechen, falls vorhanden
        
        // Neuen Timer starten, der nach 1 Sekunde den Code ausführt
        debounceTimer = Just(())
            .delay(for: .seconds(0.75), scheduler: RunLoop.main)
            .sink { _ in
                onInputChangeDelayed()
            }
    }
    
    func onInputChangeDelayed() {
        let trimmedSearch = pollsVM.pollsSearchText.trimmingCharacters(in: .whitespaces)
        print("Input hat sich seit 1 Sekunde nicht geändert: \(trimmedSearch)")
        pollsVM.loadPolls(pollsSearchText: trimmedSearch)
    }
}

struct singlePoll: View {
    
    let poll: DataClassPoll
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .strokeBorder(style: StrokeStyle(lineWidth: 3))
            VStack {
                Text(poll.label ?? "Titel")
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(poll.fieldAccepted ?? false ? Color.green : Color.red)
                        .frame(height: 70)
                        .frame(maxWidth: .infinity)
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 35, height: 35)
                        Image(systemName: poll.fieldAccepted ?? false ? "checkmark" : "xmark")
                            .foregroundStyle(poll.fieldAccepted ?? false ? Color.green : Color.red)
                    }
                }
                .padding(5)
            }
        }
    }
}

#Preview {
    PollsView()
}

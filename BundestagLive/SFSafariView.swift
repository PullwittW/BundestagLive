//
//  SFSafariView.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 12.09.24.
//

import Foundation
import SwiftUI
import SafariServices

struct SFSafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariView>) {
        // No need to do anything here
    }
}

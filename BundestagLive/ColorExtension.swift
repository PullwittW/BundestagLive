//
//  ColorExtension.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 02.09.24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let textColor = Color("TextColor")
    let sectonTextColor = Color("SecondTextColor")
    let launchColor = Color("launchColor")
}

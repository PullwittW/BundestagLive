//
//  Parliaments.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 03.09.24.
//

import Foundation

// MARK: - ParliamentResult
struct ParliamentsResult: Codable {
    let meta: Meta?
    let data: [DataClassParliament]?
}

//
//  PoliticiansModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 30.08.24.
//

import Foundation

// MARK: - PoliticianResult
struct PoliticiansResult: Codable {
    let meta: Meta?
    let data: [DataClass]?
}

//
//  PartysModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import Foundation

// MARK: - PartysResult
struct PartysResult: Codable {
    let meta: Meta?
    let data: [DataClassParty]?
}

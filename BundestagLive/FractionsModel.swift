//
//  FractionsModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import Foundation

// MARK: - FractionsResult
struct FractionsResult: Codable {
    let meta: Meta?
    let data: [DataClassFraction]?
}

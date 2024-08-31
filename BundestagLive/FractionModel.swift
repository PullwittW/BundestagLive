//
//  FractionModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import Foundation

// MARK: - FractionResult
struct FractionResult: Codable {
    let meta: Meta?
    let data: DataClassFraction?
}

// MARK: - DataClass
struct DataClassFraction: Codable, Identifiable {
    let id: Int?
    let entityType, label: String?
    let apiURL: String?
    let fullName, shortName: String?
    let legislature: Legislature?

    enum CodingKeys: String, CodingKey {
        case id
        case entityType = "entity_type"
        case label
        case apiURL = "api_url"
        case fullName = "full_name"
        case shortName = "short_name"
        case legislature
    }
}

// MARK: - Legislature
struct Legislature: Codable {
    let id: Int?
    let entityType, label: String?
    let apiURL, abgeordnetenwatchURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case entityType = "entity_type"
        case label
        case apiURL = "api_url"
        case abgeordnetenwatchURL = "abgeordnetenwatch_url"
    }
}

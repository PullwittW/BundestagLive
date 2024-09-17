//
//  PartyModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 31.08.24.
//

import Foundation

// MARK: - PartyResult
struct PartyResult: Codable {
    let meta: Meta?
    let data: DataClassParty?
}

// MARK: - DataClass
struct DataClassParty: Codable, Identifiable {
    let id: Int?
    let entityType, label: String?
    let apiURL: String?
    let fullName, shortName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case entityType = "entity_type"
        case label
        case apiURL = "api_url"
        case fullName = "full_name"
        case shortName = "short_name"
    }
    
    // Standard-Datensatz für Preview
    static let exampleParty = Party(
        id: 4,
        entityType: "party",
        label: "FDP",
        apiURL: "https://api.example.com/parties/1"
    )
}

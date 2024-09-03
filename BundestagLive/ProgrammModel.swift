//
//  ProgrammModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 01.09.24.
//

import Foundation

// MARK: - ProgrammResult
struct ProgrammResult: Codable {
    let meta: Meta?
    let data: DataClassProgramm?
}

// MARK: - DataClass
struct DataClassProgramm: Codable, Identifiable {
    let id: Int?
    let entityType, label: String?
    let apiURL: String?
    let parliamentPeriod, party: Par?
    let link: [Link]?
    let file: String?

    enum CodingKeys: String, CodingKey {
        case id
        case entityType = "entity_type"
        case label
        case apiURL = "api_url"
        case parliamentPeriod = "parliament_period"
        case party, link, file
    }
}

// MARK: - Link
struct Link: Codable {
    let uri, title, options: String?
}

// MARK: - Par
struct Par: Codable {
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

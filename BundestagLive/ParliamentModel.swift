//
//  Parliament.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 03.09.24.
//

import Foundation

// MARK: - ParliamentResult
struct ParliamentResult: Codable {
    let meta: Meta?
    let data: DataClassParliament?
}

// MARK: - DataClass
struct DataClassParliament: Codable, Identifiable {
    let id: Int?
    let entityType, label: String?
    let apiURL, abgeordnetenwatchURL: String?
    let parliament, previousPeriod: Parliament?
    let type: String?
    let electionDate: String?
    let startDatePeriod, endDatePeriod: String?

    enum CodingKeys: String, CodingKey {
        case id
        case entityType = "entity_type"
        case label
        case apiURL = "api_url"
        case abgeordnetenwatchURL = "abgeordnetenwatch_url"
        case parliament
        case previousPeriod = "previous_period"
        case type
        case electionDate = "election_date"
        case startDatePeriod = "start_date_period"
        case endDatePeriod = "end_date_period"
    }
}

// MARK: - Parliament
struct Parliament: Codable {
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

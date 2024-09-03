//
//  PollModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 01.09.24.
//

import Foundation

// MARK: - PollResult
struct PollResult: Codable {
    let meta: Meta?
    let data: DataClassPoll?
}

// MARK: - DataClass
struct DataClassPoll: Codable, Identifiable {
    let id: Int?
    let entityType, label: String?
    let apiURL, abgeordnetenwatchURL: String?
    let fieldAccepted: Bool?
//    let fieldCommittees: [String]?
    let fieldIntro: String?
    let fieldLegislature: Field?
    let fieldPollDate: String?
    let fieldRelatedLinks: [FieldRelatedLink]?
    let fieldTopics: [Field]?

    enum CodingKeys: String, CodingKey {
        case id
        case entityType = "entity_type"
        case label
        case apiURL = "api_url"
        case abgeordnetenwatchURL = "abgeordnetenwatch_url"
        case fieldAccepted = "field_accepted"
//        case fieldCommittees = "field_committees"
        case fieldIntro = "field_intro"
        case fieldLegislature = "field_legislature"
        case fieldPollDate = "field_poll_date"
        case fieldRelatedLinks = "field_related_links"
        case fieldTopics = "field_topics"
    }
}

// MARK: - Field
struct Field: Codable {
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

// MARK: - FieldRelatedLink
struct FieldRelatedLink: Codable {
    let uri: String?
    let title: String?
}

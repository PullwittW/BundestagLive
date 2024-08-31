//
//  PoliticianModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 30.08.24.
// For searchin one individual Politician

import Foundation

// MARK: - PoliticianResult
struct PoliticianResult: Codable {
    let meta: Meta?
    let data: DataClassPolitician?
}

// MARK: - DataClass
struct DataClassPolitician: Codable, Identifiable {
    let id: Int?
    let entityType, label: String?
    let apiURL, abgeordnetenwatchURL: String?
    let firstName, lastName: String?
    let birthName: String?
    let sex: String?
    let yearOfBirth: Int?
    let party: Party?
    let partyPast: String?
    let education: String?
    let residence: String?
    let occupation: String?
    let statisticQuestions: Int?
    let statisticQuestionsAnswered: Int?
    let extIDBundestagsverwaltung, qidWikidata, fieldTitle: String?

    enum CodingKeys: String, CodingKey {
        case id
        case entityType = "entity_type"
        case label
        case apiURL = "api_url"
        case abgeordnetenwatchURL = "abgeordnetenwatch_url"
        case firstName = "first_name"
        case lastName = "last_name"
        case birthName = "birth_name"
        case sex
        case yearOfBirth = "year_of_birth"
        case party
        case partyPast = "party_past"
        case education, residence, occupation
        case statisticQuestions = "statistic_questions"
        case statisticQuestionsAnswered = "statistic_questions_answered"
        case extIDBundestagsverwaltung = "ext_id_bundestagsverwaltung"
        case qidWikidata = "qid_wikidata"
        case fieldTitle = "field_title"
    }
    
    // Standard-Datensatz für Preview
    static let examplePolitician = DataClassPolitician(
        id: 119742,
        entityType: "politician",
        label: "Christian Lindner",
        apiURL: "https://api.example.com/politicians/1",
        abgeordnetenwatchURL: "https://www.abgeordnetenwatch.de/profile/max-mustermann",
        firstName: "Christian",
        lastName: "Lindner",
        birthName: nil,
        sex: "m",
        yearOfBirth: 1979,
        party: Party.exampleParty,
        partyPast: nil,
        education: "Politikwissenschaften, Staatsrecht und Philosophie",
        residence: nil,
        occupation: "Bundesminister der Finanzen, MdB, FDP-Parteivorsitzender",
        statisticQuestions: 10,
        statisticQuestionsAnswered: 8,
        extIDBundestagsverwaltung: "12345",
        qidWikidata: "Q67890",
        fieldTitle: "Abgeordneter"
    )
}

// MARK: - Party
struct Party: Codable {
    let id: Int
    let entityType, label: String?
    let apiURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case entityType = "entity_type"
        case label
        case apiURL = "api_url"
    }
    
    // Standard-Datensatz für Preview
    static let exampleParty = Party(
        id: 4,
        entityType: "party",
        label: "FDP",
        apiURL: "https://api.example.com/parties/1"
    )
}

// MARK: - Meta
struct Meta: Codable {
    let abgeordnetenwatchAPI: AbgeordnetenwatchAPI?
    let status, statusMessage: String?
    let result: Result?

    enum CodingKeys: String, CodingKey {
        case abgeordnetenwatchAPI = "abgeordnetenwatch_api"
        case status
        case statusMessage = "status_message"
        case result
    }
    
    // Standard-Datensatz für Preview
    static let example = Meta(
        abgeordnetenwatchAPI: AbgeordnetenwatchAPI.example,
        status: "OK",
        statusMessage: "Success",
        result: Result.example
    )
}

// MARK: - AbgeordnetenwatchAPI
struct AbgeordnetenwatchAPI: Codable {
    let version: String?
    let changelog: String?
    let licence: String?
    let licenceLink: String?
    let documentation: String?

    enum CodingKeys: String, CodingKey {
        case version, changelog, licence
        case licenceLink = "licence_link"
        case documentation
    }
    
    // Standard-Datensatz für Preview
    static let example = AbgeordnetenwatchAPI(
        version: "2.0",
        changelog: "Initial Release",
        licence: "MIT",
        licenceLink: "https://opensource.org/licenses/MIT",
        documentation: "https://www.abgeordnetenwatch.de/api/documentation"
    )
}

// MARK: - Result
struct Result: Codable {
    let entityID, entityType: String?

    enum CodingKeys: String, CodingKey {
        case entityID = "entity_id"
        case entityType = "entity_type"
    }
    
    // Standard-Datensatz für Preview
    static let example = Result(
        entityID: "119742",
        entityType: "Politician"
    )
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//            return true
//    }
//
//    public var hashValue: Int {
//            return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//            let container = try decoder.singleValueContainer()
//            if !container.decodeNil() {
//                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//            }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//            var container = encoder.singleValueContainer()
//            try container.encodeNil()
//    }
//}


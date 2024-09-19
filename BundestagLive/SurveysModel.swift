//
//  SurveysModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 08.09.24.
//

import Foundation

// MARK: - SurveyResult
struct SurveyResult: Codable {
    let database: Database?
    let parliaments: [String: SurveyParliament]?
    let institutes, taskers, methods: [String: Institute]?
    let parties: [String: SurveyParty]?
    let surveys: [String: Survey]?

    enum CodingKeys: String, CodingKey {
        case database = "Database"
        case parliaments = "Parliaments"
        case institutes = "Institutes"
        case taskers = "Taskers"
        case methods = "Methods"
        case parties = "Parties"
        case surveys = "Surveys"
    }
}

// MARK: - Database
struct Database: Codable {
    let license: License?
    let publisher, author: String?
    let lastUpdate: String?

    enum CodingKeys: String, CodingKey {
        case license = "License"
        case publisher = "Publisher"
        case author = "Author"
        case lastUpdate = "Last_Update"
    }
}

// MARK: - License
struct License: Codable {
    let name, shortcut: String?
    let link: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case shortcut = "Shortcut"
        case link = "Link"
    }
}

// MARK: - Institute
struct Institute: Codable {
    let name: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
    }
}

// MARK: - Parliament
struct SurveyParliament: Codable {
    let shortcut, name, election: String?

    enum CodingKeys: String, CodingKey {
        case shortcut = "Shortcut"
        case name = "Name"
        case election = "Election"
    }
}

// MARK: - Party
struct SurveyParty: Codable {
    let shortcut, name: String?

    enum CodingKeys: String, CodingKey {
        case shortcut = "Shortcut"
        case name = "Name"
    }
}

// MARK: - Survey
struct Survey: Codable, Identifiable {
    let id = UUID()
    let date: String?
    let surveyPeriod: SurveyPeriod?
    let surveyedPersons, parliamentID, instituteID, taskerID: String?
    let methodID: String?
    let results: [String: Double]?

    enum CodingKeys: String, CodingKey {
        case id
        case date = "Date"
        case surveyPeriod = "Survey_Period"
        case surveyedPersons = "Surveyed_Persons"
        case parliamentID = "Parliament_ID"
        case instituteID = "Institute_ID"
        case taskerID = "Tasker_ID"
        case methodID = "Method_ID"
        case results = "Results"
    }
}

// MARK: - SurveyPeriod
struct SurveyPeriod: Codable {
    let dateStart, dateEnd: String?

    enum CodingKeys: String, CodingKey {
        case dateStart = "Date_Start"
        case dateEnd = "Date_End"
    }
}

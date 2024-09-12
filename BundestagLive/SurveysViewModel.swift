//
//  SurveysViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 08.09.24.
//

import Foundation
import SwiftUI

@MainActor
class SurveysViewModel: ObservableObject {
    @Published var surveys: [String:Survey]? = [
        "3476" : Survey(date: Optional("2024-06-06"), surveyPeriod: Optional(BundestagLive.SurveyPeriod(dateStart: Optional("2024-05-27"), dateEnd: Optional("2024-06-03"))), surveyedPersons: Optional("1000"), parliamentID: Optional("8"), instituteID: Optional("5"), taskerID: Optional("57"), methodID: Optional("3"), results: Optional(["5": 5.0, "23": 14.0, "3": 4.0, "7": 25.0, "0": 3.0, "4": 6.0, "2": 23.0, "101": 20.0])),
        "3443" : Survey(date: Optional("2024-05-09"), surveyPeriod: Optional(BundestagLive.SurveyPeriod(dateStart: Optional("2024-05-02"), dateEnd: Optional("2024-05-07"))), surveyedPersons: Optional("1177"), parliamentID: Optional("8"), instituteID: Optional("1"), taskerID: Optional("39"), methodID: Optional("4"), results: Optional(["7": 26.0, "4": 8.0, "2": 21.0, "101": 21.0, "23": 10.0, "5": 5.0, "0": 9.0])),
        "3578" : Survey(date: Optional("2024-09-06"), surveyPeriod: Optional(BundestagLive.SurveyPeriod(dateStart: Optional("2024-08-28"), dateEnd: Optional("2024-09-03"))), surveyedPersons: Optional("1427"), parliamentID: Optional("0"), instituteID: Optional("3"), taskerID: Optional("64"), methodID: Optional("1"), results: Optional(["3": 4.0, "23": 8.0, "2": 15.0, "1": 31.0, "4": 12.0, "5": 3.0, "7": 17.0, "0": 10.0])),
        "3563" : Survey(date: Optional("2024-08-24"), surveyPeriod: Optional(BundestagLive.SurveyPeriod(dateStart: Optional("2024-08-19"), dateEnd: Optional("2024-08-23"))), surveyedPersons: Optional("1000"), parliamentID: Optional("16"), instituteID: Optional("5"), taskerID: Optional("3"), methodID: Optional("4"), results: Optional(["5": 14.0, "3": 3.0, "4": 3.0, "7": 30.0, "0": 3.0, "101": 21.0, "2": 6.0, "23": 20.0])),
        "3475" : Survey(date: Optional("2024-06-06"), surveyPeriod: Optional(BundestagLive.SurveyPeriod(dateStart: Optional("2024-06-05"), dateEnd: Optional("2024-06-06"))), surveyedPersons: Optional("1223"), parliamentID: Optional("17"), instituteID: Optional("6"), taskerID: Optional("5"), methodID: Optional("4"), results: Optional(["18": 3.0, "5": 3.0, "1": 30.0, "3": 4.0, "4": 14.0, "23": 7.0, "0": 11.0, "2": 14.0, "7": 14.0])),
        "3430" : Survey(date: Optional("2024-04-28"), surveyPeriod: Optional(BundestagLive.SurveyPeriod(dateStart: Optional("2024-04-22"), dateEnd: Optional("2024-04-25"))), surveyedPersons: Optional("1181"), parliamentID: Optional("10"), instituteID: Optional("1"), taskerID: Optional("28"), methodID: Optional("4"), results: Optional(["4": 17.0, "101": 38.0, "3": 5.0, "23": 3.0, "0": 7.0, "7": 11.0, "2": 19.0])),
        "3456" : Survey(date: Optional("2024-05-20"), surveyPeriod: Optional(BundestagLive.SurveyPeriod(dateStart: Optional("2024-05-13"), dateEnd: Optional("2024-05-19"))), surveyedPersons: Optional("2500"), parliamentID: Optional("0"), instituteID: Optional("24"), taskerID: Optional("97"), methodID: Optional("3"), results: Optional(["4": 13.5, "2": 16.5, "0": 9.0, "5": 3.0, "23": 6.0, "3": 6.0, "7": 15.0, "1": 31.0])),
        "3562" : Survey(date: Optional("2024-08-24"), surveyPeriod: Optional(BundestagLive.SurveyPeriod(dateStart: Optional("2024-08-19"), dateEnd: Optional("2024-08-23"))), surveyedPersons: Optional("1000"), parliamentID: Optional("13"), instituteID: Optional("5"), taskerID: Optional("3"), methodID: Optional("4"), results: Optional(["4": 5.0, "0": 5.0, "101": 30.0, "7": 32.0, "8": 3.0, "2": 6.0, "23": 15.0, "5": 4.0])),
        "3571" : Survey(date: Optional("2024-08-31"), surveyPeriod: Optional(BundestagLive.SurveyPeriod(dateStart: Optional("2024-08-26"), dateEnd: Optional("2024-08-31"))), surveyedPersons: Optional("1000"), parliamentID: Optional("13"), instituteID: Optional("24"), taskerID: Optional("97"), methodID: Optional("3"), results: Optional(["2": 6.0, "101": 33.0, "23": 13.5, "0": 8.0, "5": 3.0, "7": 31.0, "4": 5.5])),
        "3540" : Survey(date: Optional("2024-08-13"), surveyPeriod: Optional(BundestagLive.SurveyPeriod(dateStart: Optional("2024-08-06"), dateEnd: Optional("2024-08-12"))), surveyedPersons: Optional("1006"), parliamentID: Optional("0"), instituteID: Optional("4"), taskerID: Optional("7"), methodID: Optional("4"), results: Optional(["1": 32.0, "4": 12.0, "0": 7.0, "5": 3.0, "7": 17.0, "3": 5.0, "8": 2.0, "2": 14.0, "23": 8.0])),
        "3576" : Survey(date: Optional("2024-09-05"), surveyPeriod: Optional(BundestagLive.SurveyPeriod(dateStart: Optional("2024-09-03"), dateEnd: Optional("2024-09-04"))), surveyedPersons: Optional("1207"), parliamentID: Optional("4"), instituteID: Optional("1"), taskerID: Optional("119"), methodID: Optional("4"), results: Optional(["5": 4.0, "101": 18.0, "7": 27.0, "23": 15.0, "2": 23.0, "0": 5.0, "4": 5.0, "14": 3.0]))]

                        
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    @State private var round = 0
    
    func loadSurveys() {
        Task {
            await fetchSurveys()
        }
    }
    
    func fetchSurveys() async {
        print("LOADING Surveys")
        guard let url = URL(string: "https://api.dawum.de/newest_surveys.json") else {
            print("Ungültige Surveys URL")
            errorMessage = "Ungültige Surveys URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedSurveys = try JSONDecoder().decode(SurveyResult.self, from: data)
            
            self.surveys = decodedSurveys.surveys
            
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der Surveys-Daten: \(error)")
        }
        
        for s in surveys ?? [:] {
            if round < 5 {
                print(s)
                round = round + 1
            }
        }
        
        isLoading = false
    }
    
    func getSurveyId(surveyLand:String) -> String {
        let land = surveyLand
        switch land {
        case "Bundestag":
            return "0"
        case "Baden-Württemberg":
            return "1"
        case "Bayern":
            return "2"
        case "Berlin":
            return "3"
        case "Brandenburg":
            return "4"
        case "Bremen":
            return "5"
        case "Hamburg":
            return "6"
        case "Hessen":
            return "7"
        case "Mecklenburg-Vorpommern":
            return "8"
        case "Niedersachsen":
            return "9"        
        case "Nordrhein-Westfahlen":
            return "10"
        case "Rheinland-Pfalz":
            return "11"
        case "Saarland":
            return "12"
        case "Sachsen":
            return "13"
        case "Sachsen-Anhalt":
            return "14"
        case "Schleswig-Holstein":
            return "15"        
        case "Thüringen":
            return "16"
        case "EU-Parlament":
            return "17"
            
        default:
            return "0"
        }
    }
}

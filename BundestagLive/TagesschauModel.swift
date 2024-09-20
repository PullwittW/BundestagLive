//
//  TagesschauModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 20.09.24.
//

import Foundation

// MARK: - Welcome
struct TagesschauResult: Codable {
    let news: [News]?
}

// MARK: - News
struct News: Codable, Identifiable {
    let id = UUID()
    let sophoraID, externalID, title, date: String?
    let teaserImage: TeaserImage?
    let tags: [Tag]?
    let updateCheckURL: String?
    let tracking: [Tracking]?
    let topline, firstSentence: String?
    let details: String?
    let detailsweb, shareURL: String?
    let geotags: [Tag]?
    let regionID: Int?
    let regionIDS: [Int]?
    let ressort: String?
    let breakingNews: Bool?
    let type: String?
    
    enum CodingKeys: CodingKey {
        case id
        case sophoraID
        case externalID
        case title
        case date
        case teaserImage
        case tags
        case updateCheckURL
        case tracking
        case topline
        case firstSentence
        case details
        case detailsweb
        case shareURL
        case geotags
        case regionID
        case regionIDS
        case ressort
        case breakingNews
        case type
    }
    
    static let newsExample =
        News(
            sophoraID: nil,
            externalID: nil,
            title: Optional("Zehntausende demonstrieren für mehr Klimaschutz"),
            date: Optional("2024-09-20T18:23:22.176+02:00"),
            teaserImage: TeaserImage(alttext: Optional("Eine Aktivistin von \"Fridays for Future\" bei einer Kundgebung"), imageVariants: ImageVariants(the1X1144: nil, the1X1256: nil, the1X1432: nil, the1X1640: nil, the1X1840: nil, the16X9256: nil, the16X9384: nil, the16X9512: nil, the16X9640: nil, the16X9960: nil, the16X91280: nil, the16X91920: nil), type: Optional("image")),
            tags: [Tag(tag: Optional("Fridays for Future")), Tag(tag: Optional("Klimawandel"))],
            updateCheckURL: nil,
            tracking: [],
            topline: Optional("\"Fridays for Future\""),
            firstSentence: Optional("In mehr als 100 deutschen Städten demonstrierten Menschen beim sogenannten globalen \"Klimastreik\"."),
            details: nil,
            detailsweb: Optional("https://www.tagesschau.de/inland/gesellschaft/fridays-for-future-254.html"),
            shareURL: Optional("https://www.tagesschau.de/inland/gesellschaft/fridays-for-future-254.html"),
            geotags: [],
            regionID: nil,
            regionIDS: nil,
            ressort: nil,
            breakingNews: false,
            type: nil)
}

// MARK: - Tag
struct Tag: Codable {
    let tag: String?
}

// MARK: - TeaserImage
struct TeaserImage: Codable {
    let alttext: String?
    let imageVariants: ImageVariants?
    let type: String?
}

// MARK: - ImageVariants
struct ImageVariants: Codable {
    let the1X1144, the1X1256, the1X1432, the1X1640: String?
    let the1X1840, the16X9256, the16X9384, the16X9512: String?
    let the16X9640, the16X9960, the16X91280, the16X91920: String?
}

// MARK: - Tracking
struct Tracking: Codable {
    let sid, src, ctp, pdt: String?
    let otp, cid, pti, bcr: String?
    let type: String?
    let avFullShow: Bool?
}

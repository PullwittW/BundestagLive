//
//  TagesschauModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 20.09.24.
//

import Foundation

import Foundation

// MARK: - Welcome
struct TagesschauResult: Codable {
    let news: [News]?
    let regional: [Regional]?
    let newStoriesCountLink: String?
    let type: String?
}

// MARK: - News
struct News: Codable, Identifiable {
    let id = UUID()
    let sophoraID, externalID, title, date: String?
    let teaserImage: FirstFrame
    let tags: [Tag]?
    let updateCheckURL: String?
    let content: [NewsContent]?
    let tracking: [ContentTracking]?
    let topline, firstSentence: String?
    let video: Video?
    let images: [FirstFrame]?
    let firstFrame: FirstFrame?
    let details: String?
    let detailsweb, shareURL: String?
    let geotags: [Tag]?
    let regionID: Int?
    let regionIDS: [Int]?
    let ressort: String?
    let crop: Crop?
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
        case content
        case tracking
        case topline
        case firstSentence
        case video
        case images
        case firstFrame
        case details
        case detailsweb
        case shareURL
        case geotags
        case regionID
        case regionIDS
        case ressort
        case crop
        case breakingNews
        case type
    }
    
    static let newsExample =
        News(sophoraID: nil,
             externalID: nil,
             title: "Mehr Sicherheit und mehr für\'s Bier",
             date: "2024-09-21T10:16:32.432+02:00",
             teaserImage: FirstFrame(alttext: "Oktoberfestbesucher stürmen auf die Festwiese", imageVariants: nil, type: "image", copyright: nil, title: nil),
             tags: [Tag(tag: "Oktoberfest")],
             updateCheckURL: nil,
             content: nil,
             tracking: nil,
             topline: "189. Oktoberfest in München",
             firstSentence: "In München ist das Oktoberfestgelände geöffnet worden.",
             video: nil,
             images: nil,
             firstFrame: FirstFrame(alttext: nil, imageVariants: ["1x1-840" : "https://images.tagesschau.de/image/415a798f-30b2-448d-927a-3f50a827da03/AAABjG8AzS8/AAABkZLoaiw/1x1-840.jpg"], type: "image", copyright: nil, title: nil),
             details: nil,
             detailsweb: "https://www.br.de/nachrichten/bayern/br24live-zum-wiesn-start-oans-zwoa-drei-run,UOvNkLs",
             shareURL: "https://www.tagesschau.de/inland/oktoberfest-muenchen-104.html",
             geotags: nil,
             regionID: nil,
             regionIDS: nil,
             ressort: "inland",
             crop: nil,
             breakingNews: false,
             type: "webview")
}

// MARK: - NewsContent
struct NewsContent: Codable {
    let value: String?
    let type: String?
    let box: Box?
    let related: [Related]?
    let title, date: String?
    let teaserImage: FirstFrame?
    let tracking: [ContentTracking]?
    let text: String?
    let stream: String?
    let gallery: [FirstFrame]?
    let video: Video?
}

// MARK: - Box
struct Box: Codable {
    let image: FirstFrame?
    let link, subtitle, text, title: String?
}

// MARK: - FirstFrame
struct FirstFrame: Codable {
    let alttext: String?
    let imageVariants: [String:String]?
    let type: String?
    let copyright, title: String?
}

//// MARK: - FirstFrameImageVariants
//struct FirstFrameImageVariants: Codable {
//    let "1x1-144", the1X1256, the1X1432, the1X1640: String?
//    let the1X1840, the16X9256, the16X9384, the16X9512: String?
//    let the16X9640, the16X9960, the16X91280, the16X91920: String?
//}

// MARK: - Related
struct Related: Codable {
    let teaserImage: FirstFrame?
    let date, sophoraID, externalID, topline: String?
    let title: String?
    let details: String?
    let detailsweb: String?
    let type: String?
}

// MARK: - ContentTracking
struct ContentTracking: Codable {
    let sid, src: String?
    let ctp: String?
    let pdt: String?
    let otp: String?
    let cid, pti: String?
    let bcr: String?
    let type: String?
    let avFullShow: Bool?
    let avAirTime: String?
}

// MARK: - Video
struct Video: Codable {
    let sophoraID, externalID, title, date: String?
    let teaserImage: FirstFrame?
    let tags: [Tag]?
    let updateCheckURL: String?
    let tracking: [VideoTracking]?
    let streams: Streams?
    let alttext: String?
    let copyright: String?
    let type: String?
}

// MARK: - Streams
struct Streams: Codable {
    let h264S, h264M, h264Xl: String?
    let adaptivestreaming: String?
}

// MARK: - VideoTracking
struct VideoTracking: Codable {
    let sid, src: String?
    let ctp: String?
    let pdt: String?
    let otp: String?
    let cid, pti: String?
    let bcr: String?
    let type: String?
    let avFullShow: Bool?
    let assetid: String?
    let program: String?
    let title, length: String?
    let c2: String?
    let c5, c7, c8, c9: String?
    let c10: String?
    let c12: String?
    let c16: String?
    let c18: String?
    let typeNielsen: String?
}

// MARK: - Crop
struct Crop: Codable {
    let id: String?
    let type: String?
    let croppingAPIVersion, croppingUIVersion, croppingServiceVersion: String?
    let noSound: Bool?
    let videoSrc: String?
    let imageSrc, imageNames: [String]?
    let headerText: String?
    let mainTexts, sceneSrcTexts: [String]?
    let cameraMoves: [CameraMove]?
    let events: [[Double]]?
}

// MARK: - CameraMove
struct CameraMove: Codable {
    let point1X: Int?
    let point1Y, point2X: Double?
    let point2Y, startLeft, endLeft, duration: Int?
}

// MARK: - Tag
struct Tag: Codable {
    let tag: String?
}

// MARK: - Regional
struct Regional: Codable {
    let sophoraID, externalID, title, date: String?
    let teaserImage: FirstFrame?
    let tags: [Tag]?
    let updateCheckURL: String?
    let content: [RegionalContent]?
    let tracking: [ContentTracking]?
    let topline, firstSentence: String?
    let images: [FirstFrame]?
    let brandingImage: BrandingImage?
    let details: String?
    let detailsweb, shareURL: String?
    let geotags: [Tag]?
    let regionID: Int?
    let regionIDS: [Int]?
    let breakingNews: Bool?
    let type: String?
}

// MARK: - BrandingImage
struct BrandingImage: Codable {
    let title, copyright, alttext: String?
    let imageVariants: BrandingImageImageVariants?
    let type: String?
}

// MARK: - BrandingImageImageVariants
struct BrandingImageImageVariants: Codable {
    let original: String?
}

// MARK: - RegionalContent
struct RegionalContent: Codable {
    let value: String?
    let type: String?
    let video: Video?
    let quotation: Quotation?
    let box: Box?
    let gallery: [FirstFrame]?
    let title, date: String?
    let teaserImage: FirstFrame?
    let tracking: [ContentTracking]?
    let stream: String?
}

// MARK: - Quotation
struct Quotation: Codable {
    let text: String?
}

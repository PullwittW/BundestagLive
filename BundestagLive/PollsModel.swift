//
//  PollsModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 01.09.24.
//

import Foundation

// MARK: - PollsResult
struct PollsResult: Codable {
    let meta: Meta?
    let data: [DataClassPoll]?
}

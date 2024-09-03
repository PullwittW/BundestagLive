//
//  ProgrammsModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 01.09.24.
//

import Foundation

// MARK: - ProgrammsResult
struct ProgrammsResult: Codable {
    let meta: Meta?
    let data: [DataClassProgramm]?
}

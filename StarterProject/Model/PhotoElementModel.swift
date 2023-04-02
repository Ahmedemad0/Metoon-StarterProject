//
//  BaseResponse.swift
//  Starter Project
//
//  Created by Ahmed Emad on 30/03/2023.
//

import Foundation

// MARK: - PhotoElementModel
struct PhotoElementModel: Codable {
    let id: String
    let urls: Urls
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

//
//  PhotosRequestNetworking.swift
//  Starter Project
//
//  Created by Ahmed Emad on 01/04/2023.
//

import Foundation
enum PhotosRequestNetworking {
    case photos

}

extension PhotosRequestNetworking: TargetType {
    
    var baseURL: String {
        switch self {
        default:
            return "https://api.unsplash.com/photos"
        }
    }
    
    var keyURL: String {
        switch self {
        case .photos:
            return "?client_id=Ahj-66mbyiRNL-GhTltHoIgGfkznNgv7SALhCOTLMaM"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .photos:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .photos:
            return .requestPlain
        }
    }
}

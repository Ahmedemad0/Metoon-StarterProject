//
//  TargetType.swift
//  Starter Project
//
//  Created by Ahmed Emad on 30/03/2023.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    
}

enum Task {
    case requestPlain
}

protocol TargetType {
    var baseURL: String { get }
    var keyURL: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
}

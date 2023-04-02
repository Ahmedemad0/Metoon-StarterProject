//
//  BaseAPI.swift
//  Starter Project
//
//  Created by Ahmed Emad on 30/03/2023.
//

import Foundation

class BaseAPI<T: TargetType> {
    var acceptableStatusCodes = [] + (200..<300).reversed() + (400..<500).reversed()
    
    func fetchData<M: Codable>(target: T, responseClass: M.Type, completion: @escaping(Result<M?,Error>)-> Void){
        
        guard let url = URL(string: target.baseURL + target.keyURL) else {
            completion(.failure(CustomError(title: "URL ERROR", description:" Check URL cause An Error Has Occured With it" , code: 1)))
                return
             }
        
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                completion(.failure(CustomError(title: "Method Error ", description:"Error: error calling \(target.method.rawValue)" , code: 2)))
                    return
            }
            
            guard let data = data else {
                completion(.failure(CustomError(title: "Data Error ", description:"Error: Did not receive data" , code: 3)))
                    return
            }
                
            guard let responseOBJ = try? JSONDecoder().decode(M.self, from: data) else {
                completion(.failure(CustomError(title: "An Error Has Occured", description: "decode error" , code: 1)))

                return
            }
            if let response = response as? HTTPURLResponse , (200 ..< 299) ~= response.statusCode {
                completion(.success(responseOBJ))
            } else {
                completion(.failure(CustomError(title: "An Error Has Occured", description:"response error" , code: 5)))
                    return

            }
        }.resume()
    }
}

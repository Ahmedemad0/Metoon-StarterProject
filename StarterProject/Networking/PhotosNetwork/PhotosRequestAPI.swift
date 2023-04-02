//
//  PhotosRequestAPI.swift
//  Starter Project
//
//  Created by Ahmed Emad on 01/04/2023.
//

import Foundation

protocol PhotosRequestAPIProtocol {
    func getPhotosRequest(completion: @escaping(Result<[PhotoElementModel]?, Error>)-> Void)
}

class PhotosRequestAPI: BaseAPI<PhotosRequestNetworking>, PhotosRequestAPIProtocol{
    
    func getPhotosRequest(completion: @escaping(Result<[PhotoElementModel]?, Error>)-> Void){
        self.fetchData(target: .photos, responseClass: [PhotoElementModel].self) { result in
            completion(result)
        }
    }
}

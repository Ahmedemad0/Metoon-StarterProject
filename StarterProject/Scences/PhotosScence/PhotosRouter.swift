//
//  PhotosRouter.swift
//  StarterProject
//
//  Created by Ahmed Emad on 01/04/2023.
//

import UIKit

protocol PhotosRouterProtocol {
    static func createScene() -> UIViewController
    func navigateTo(destination: PhotosDestinations, fromViewController viewController: PhotosViewController)
}

enum PhotosDestinations {
    case previewPhoto(url: String)
}

class PhotosRouter : PhotosRouterProtocol {
   
    static func createScene() -> UIViewController {
        let router = PhotosRouter()
        let viewController = PhotosViewController(router: router)
        return viewController
    }
    
    func navigateTo(destination: PhotosDestinations, fromViewController viewController: PhotosViewController) {
        switch destination {
        case .previewPhoto(let url):
            navigateToDisplayPhotoScreen(fromView: viewController, withPhotoUrl: url)
        }
    }
    
    private func navigateToDisplayPhotoScreen(fromView viewController: PhotosViewController, withPhotoUrl photoUrl: String){
        let destinationViewController = DisplayPhotoViewController(router: DisplayPhotoRouter())
        destinationViewController.photoUrl = photoUrl
        viewController.navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
 
}

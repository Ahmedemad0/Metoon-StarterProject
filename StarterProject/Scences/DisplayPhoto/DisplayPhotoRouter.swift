//
//  DisplayPhotoRouter.swift
//  StarterProject
//
//  Created by Ahmed Emad on 01/04/2023.
//

import UIKit

protocol DisplayPhotoRouterProtocol {
    static func createScene() -> UIViewController
    func navigateTo(destination: DisplayPhotoDestinations, fromViewController viewController: DisplayPhotoViewController)
}

enum DisplayPhotoDestinations {
    case backScreen
}

class DisplayPhotoRouter : DisplayPhotoRouterProtocol {
   
    static func createScene() -> UIViewController {
        let router = DisplayPhotoRouter()
        let viewController = DisplayPhotoViewController(router: router)
        return viewController
    }
    
    func navigateTo(destination: DisplayPhotoDestinations, fromViewController viewController: DisplayPhotoViewController) {
        switch destination {
        case .backScreen:
            navigateToBackScreen(fromView: viewController)
        }
    }
    
    private func navigateToBackScreen(fromView viewController: DisplayPhotoViewController){
        viewController.navigationController?.popViewController(animated: true)
    }
}

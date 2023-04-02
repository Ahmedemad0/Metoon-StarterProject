//
//  DisplayPhotoViewController.swift
//  StarterProject
//
//  Created by Ahmed Emad on 01/04/2023.
//

import UIKit

protocol DisplayPhotoViewControllerProtocol {
    func didTapBack()
}

class DisplayPhotoViewController: UIViewController, DisplayPhotoViewControllerProtocol {
    
    // MARK: Properities
    var photoUrl: String = ""
    let router: DisplayPhotoRouterProtocol
    
    // MARK: - Outlets
    @IBOutlet weak var mainView: DisplayPhotoView!
    
    
    // MARK: - Methods
    init(router: DisplayPhotoRouterProtocol) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.viewDidLoad()
        mainView.delegate = self
        mainView.downloadImage(urlString: photoUrl)
    }
    
    func didTapBack(){
        router.navigateTo(destination: .backScreen, fromViewController: self)
    }
}

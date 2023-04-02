//
//  PhotosViewController.swift
//  StarterProject
//
//  Created by Ahmed Emad on 01/04/2023.
//

import UIKit

protocol PhotosViewControllerProtocol {
    var photosModelsCount: Int {get}
    func setupPhotosCollectionViewCell(cell: PhotosCollectionViewCellProtocol ,atIndex index: Int)
    func didSelectPhoto(index: Int)}

class PhotosViewController: UIViewController, PhotosViewControllerProtocol {

    // MARK: - Properities
    let requestAPI: PhotosRequestAPIProtocol = PhotosRequestAPI()
    let router: PhotosRouterProtocol
    
    var photosModels = [PhotoElementModel](){
        didSet{
            mainView.reloadPhotosCollectionViewData()
        }
    }
    var photosModelsCount: Int {
        return photosModels.count
    }
    
    // MARK: - Outlets
    @IBOutlet weak var mainView: PhotosView!

    
    // MARK: - Methods
    init(router: PhotosRouterProtocol) {
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
        getPhotosRequest()
    }

    private func getPhotosRequest(){
        requestAPI.getPhotosRequest {[weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                guard let data = data else { return}
                self.photosModels.append(contentsOf: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    func setupPhotosCollectionViewCell(cell: PhotosCollectionViewCellProtocol ,atIndex index: Int) {
        cell.configureCell(model: photosModels[index])
    }
    
    func didSelectPhoto(index: Int){
        router.navigateTo(destination: .previewPhoto(url: photosModels[index].urls.regular), fromViewController: self)
    }
}

//
//  PhotosView.swift
//  StarterProject
//
//  Created by Ahmed Emad on 01/04/2023.
//

import UIKit

class PhotosView: UIView {
    // MARK: - Properities
    var delegate: PhotosViewControllerProtocol!
    
    // MARK: - Outlets
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    // MARK: - Methods
    func viewDidLoad(){
        setDelegates()
        photosCollectionView.register(cells: [PhotosCollectionViewCell.self])
    }
    
    private func setDelegates(){
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
    }
    
    func reloadPhotosCollectionViewData(){
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            self.photosCollectionView.reloadData()
        }
    }
}

extension PhotosView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate.photosModelsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as PhotosCollectionViewCell
        delegate.setupPhotosCollectionViewCell(cell: cell, atIndex: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didSelectPhoto(index: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 2) - 15
        return CGSize(width: width, height: width)
    }
}

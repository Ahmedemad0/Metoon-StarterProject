//
//  PhotosCollectionViewCell.swift
//  StarterProject
//
//  Created by Ahmed Emad on 01/04/2023.
//

import UIKit

protocol PhotosCollectionViewCellProtocol {
    func configureCell(model: PhotoElementModel)
}
class PhotosCollectionViewCell: UICollectionViewCell, PhotosCollectionViewCellProtocol {

    @IBOutlet weak var photo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(model: PhotoElementModel){
        photo.loadImage(urlString: model.urls.regular)
    }

}

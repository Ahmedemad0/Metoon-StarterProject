//
//  DisplayPhotoView.swift
//  StarterProject
//
//  Created by Ahmed Emad on 01/04/2023.
//

import UIKit

class DisplayPhotoView: UIView {

    // MARK: - Properities
    var delegate: DisplayPhotoViewControllerProtocol!
    
    // MARK: Outlets
    @IBOutlet weak var photo: UIImageView!
    
    // MARK: - Methods
    func viewDidLoad(){}

    func downloadImage(urlString: String){
        photo.loadImage(urlString: urlString)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        delegate.didTapBack()
    }
}

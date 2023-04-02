//
//  UIImageView+Extension.swift
//  StarterProject
//
//  Created by Ahmed Emad on 01/04/2023.
//

import UIKit

extension UIImageView {
    func loadImage(urlString: String){
        guard let url = URL(string: urlString) else {return}
        
        DispatchQueue.global().async {[weak self] in
            guard let self = self else {return}
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}

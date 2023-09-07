//
//  UIImageView+Ext.swift
//  MedisApplication
//
//  Created by Samsud Dhuha on 06/09/23.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    let imageData = image.jpegData(compressionQuality: 0.1)
                    if let imageData = imageData, let image = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}

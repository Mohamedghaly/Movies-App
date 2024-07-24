//
//  UIImageView +Ex.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 24/07/2024.
//

import UIKit

extension UIImageView {
    public func imageFromUrl(imagePath: String) {
        if let url = URL(string: APIConstants.storageURL + imagePath) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
}

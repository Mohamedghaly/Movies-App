//
//  CollectionViewCell.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 24/07/2024.
//

import UIKit

protocol MoviesCellProtocol {
    func configureCell(with data: MoviesResult?)
}

class MoviesCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    fileprivate func setupUI(){
        movieImage.drawShadow()
    }

}
extension MoviesCell: MoviesCellProtocol{
    func configureCell(with data: MoviesResult?) {
        guard let imageURL = data?.backdropPath else { return }
        movieImage.imageFromUrl(imagePath: imageURL)
    }
}

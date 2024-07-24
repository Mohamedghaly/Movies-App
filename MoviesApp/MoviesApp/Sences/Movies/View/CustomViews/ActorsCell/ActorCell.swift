//
//  TableViewCell.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 24/07/2024.
//

import UIKit
protocol ActorCellProtocol {
    func configureCell(with data: Cast?)
}


class ActorCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var actorName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    fileprivate func setupUI(){
        containerView.drawShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
    }
    
}
extension ActorCell: ActorCellProtocol{
    func configureCell(with data: Cast?) {
        guard let data else { return }
        actorName.text = data.originalName
        guard let imageURL = data.profilePath else { return }
        actorImage.imageFromUrl(imagePath: imageURL)
    }
}

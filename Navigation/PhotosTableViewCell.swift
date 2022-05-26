//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 26.05.2022.
//

import UIKit

//ячейка с коллекцией фото для таблицы

class PhotosTableViewCell: UITableViewCell {

    //MARK: - parameters

    //photosLabel
    let photosLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textColor = .black
        $0.text = "Photos"
        return $0
    }(UILabel())

    //MARK: - functions

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

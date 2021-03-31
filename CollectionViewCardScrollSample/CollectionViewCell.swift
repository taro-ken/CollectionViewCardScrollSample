//
//  CollectionViewCell.swift
//  CollectionViewCardScrollSample
//
//  Created by 木元健太郎 on 2021/03/31.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        backgroundImageView.layer.cornerRadius = 12
        
    }
    private func configure(menu: Model) {

        titleLabel?.text = menu.numbername
    }
    
    
}

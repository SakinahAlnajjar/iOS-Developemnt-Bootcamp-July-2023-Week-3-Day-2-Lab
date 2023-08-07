//
//  CollectionViewCell.swift
//  Week3Day2Lab
//
//  Created by سكينه النجار on 07/08/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemName: UILabel!
    
    override var isSelected: Bool {
            didSet {
                contentView.backgroundColor = isSelected ? .systemCyan : .systemGray5
            }
        }
    
}

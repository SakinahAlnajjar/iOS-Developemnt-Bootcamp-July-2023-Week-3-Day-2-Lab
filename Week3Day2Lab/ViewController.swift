//
//  ViewController.swift
//  Week3Day2Lab
//
//  Created by سكينه النجار on 07/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var btn: UIButton!
    
    var firstSectionData = ["TV & Movies", "Travel", "Celebs", "Resturants"]
    var secondSectionData = ["Travel Tips" , "Fashion", "Cars"]
    var thirdSectionData = ["Gym", "Health"]
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = true
        
        firstLabel.text = "Personalize your feed"
        secondLabel.text = "Select 10 or more topics"
        
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return firstSectionData.count
        case 1:
            return secondSectionData.count
        case 2:
            return thirdSectionData.count
        default:
            return firstSectionData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.layer.cornerRadius = 12
        switch indexPath.section {
        case 0:
            cell.itemName.text = firstSectionData[indexPath.row]
        case 1:
            cell.itemName.text = secondSectionData[indexPath.row]
        case 2:
            cell.itemName.text = thirdSectionData[indexPath.row]
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        counter = counter + 1
        btn.titleLabel?.text = "\(counter) selected"
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        counter = counter - 1
        btn.titleLabel?.text = "\(counter) selected"
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader {
            switch indexPath.section {
            case 0:
                header.sectionHeaderlabel.text = "Most Popular"
            case 1:
                header.sectionHeaderlabel.text = "Life Style"
            case 2:
                header.sectionHeaderlabel.text = "Health"
            default:
                break
            }
            return header
        }
        return UICollectionReusableView()
    }
}



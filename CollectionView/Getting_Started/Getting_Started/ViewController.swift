//
//  ViewController.swift
//  Getting_Started
//
//  Created by lee on 2018. 2. 14..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionData = ["1 🍏", "2 🍎", "3 🍐", "4 🍊", "5 🍋", "6 🍌", "7 🍉", "8 🍇", "9 🍓", "10 🍈", "11 🍒", "12 🍑"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    //셀의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    //셀 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        if let label = cell.viewWithTag(100) as? UILabel {
            label.text = collectionData[indexPath.row]
        }
        return cell
    }
    
    
}


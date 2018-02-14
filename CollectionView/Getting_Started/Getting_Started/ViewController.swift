//
//  ViewController.swift
//  Getting_Started
//
//  Created by lee on 2018. 2. 14..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionData = ["1 🍏", "2 🍎", "3 🍐", "4 🍊", "5 🍋", "6 🍌", "7 🍉", "8 🍇", "9 🍓", "10 🍈", "11 🍒", "12 🍑"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let width = (view.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh), for: UIControlEvents.valueChanged)
        collectionView.refreshControl = refresh
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            if let dest = segue.destination as? DetailsViewController,
                let index = sender as? IndexPath {
                dest.selection = collectionData[index.row]
            }
        }
    }

    @IBAction func addItems() {
        for _ in 0..<2 {
            collectionView.performBatchUpdates({
                let text = "\(collectionData.count - 1) 🐱"
                collectionData.append(text)
                let index = IndexPath(row: collectionData.count - 1, section: 0)
                collectionView.insertItems(at: [index])
            }, completion: nil)
        }
    }
    
    @objc func refresh() {
        addItems()
        collectionView.refreshControl?.endRefreshing()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailSegue", sender: indexPath)
    }
    
    
}


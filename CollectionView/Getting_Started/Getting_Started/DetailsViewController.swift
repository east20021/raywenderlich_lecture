//
//  DetailsViewController.swift
//  Getting_Started
//
//  Created by lee on 2018. 2. 14..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    var selection: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsLabel.text = selection
        
    }

}

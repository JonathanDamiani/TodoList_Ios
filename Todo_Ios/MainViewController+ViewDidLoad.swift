//
//  MainViewController+ViewDidLoad.swift
//  Todo_Ios
//
//  Created by Jonathan Dean de Melo Damiani on 2020-09-20.
//  Copyright © 2020 deanvelopment. All rights reserved.
//

import UIKit

extension MainViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AppData.initialize()
       
        separateItems()
        
        self.tableView.tableFooterView = UIView()
        self.tableView.tableHeaderView = headerView
        self.newItemTextField.delegate = self
        
        // change placeholder color
        newItemTextField.attributedPlaceholder =
            NSAttributedString(string: "+ New Item", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}

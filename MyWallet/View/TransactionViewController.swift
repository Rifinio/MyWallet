//
//  TransactionViewController.swift
//  MyWallet
//
//  Created by Adil Bougamza on 15/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import UIKit

class TransactionViewModel {
    
}

class TransactionViewController: UIViewController {

    var viewModel: TransactionViewModel!
    
    init(viewModel: TransactionViewModel) {
        super.init(nibName: nil, bundle: nil)

        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}

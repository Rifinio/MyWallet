//
//  AccountViewController.swift
//  MyWallet
//
//  Created by Adil Bougamza on 14/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    // MARK: - UI Elements
    let mainView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        v.layer.cornerRadius = 40

        return v
    }()
    let titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.textColor = .white
        return l
    }()
    let cardView: CreditCardView = {
        let v = CreditCardView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var viewModel: AccountViewModel!

    init(viewModel: AccountViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "My Wallet"

        setupView()
        setupConstraints()
        setupData()
        
        viewModel.user?.account.logTransactions()
    }
    
    // MARK: - View setup
    private func setupView() {
        setupNavigationBar()
        view.addSubview(mainView)
        mainView.addSubview(cardView)
    }
    
    private func setupData() {
        guard let user = viewModel.user else {return}
        cardView.accountNumber = user.account.account
        cardView.balance = "€ \(user.account.balance)"
        cardView.holderName = user.fullName
        cardView.providerImage = AppStyle.Card.providerMaestroImage
        cardView.backgrounImage = AppStyle.Card.backgroundImage
    }

    private func setupConstraints() {
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).activate()
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).activate()
        
        let edgeInset = UIEdgeInsets(top: 50, left: 20, bottom: -20, right: -20)
        cardView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: edgeInset.top).activate()
        cardView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: edgeInset.left).activate()
        cardView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: edgeInset.right).activate()
        cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 0.7).activate()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: AppStyle.Font.bold(24) as Any]
    }
}

extension NSLayoutConstraint {
    func activate() {
        isActive = true
    }
}


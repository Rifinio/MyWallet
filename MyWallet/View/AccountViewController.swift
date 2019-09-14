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
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 40

        return view
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "MyWallet"

        setupView()
        setupConstraints()
    }
    
    // MARK: - View setup
    private func setupView() {
        setupNavigationBar()
        view.addSubview(mainView)

    }

    private func setupConstraints() {
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).activate()
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).activate()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

extension NSLayoutConstraint {
    func activate() {
        isActive = true
    }
}


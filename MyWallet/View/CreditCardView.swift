//
//  CreditCardView.swift
//  MyWallet
//
//  Created by Adil Bougamza on 14/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import UIKit

public enum CreditCardType {
    case debitCard
    case creditCard
}

class CreditCardView: UIView {
    // can be used to have different card design depening on type
    var cardType: CreditCardType = .debitCard
    
    // MARK: - Public properties
    var backgrounImage: UIImage! {
        didSet {
            bgImageView.image = backgrounImage
        }
    }
    var providerImage: UIImage! {
        didSet {
            LogoImageView.image = providerImage
        }
    }
    var holderName: String! {
        didSet {
            labelAccountName.text = holderName
        }
    }
    var balance: String! {
        didSet {
            labelBalance.text = balance
        }
    }
    var accountNumber: String! {
        didSet {
            labelAccountNumber.text = accountNumber
        }
    }
    
    // MARK: - UI Elements
    private let bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let LogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let labelAccountNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = AppStyle.Font.regular(18)
        return label
    }()
    private let labelBalance: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = AppStyle.Font.bold(35)
        return label
    }()
    private let labelAccountName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = AppStyle.Font.regular(18)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    // MARK: - Setup View
    private func setupView() {
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
        addSubview(bgImageView)
        addSubview(LogoImageView)
        
        addSubview(labelBalance)
        addSubview(labelAccountNumber)
        addSubview(labelAccountName)
    }
    
    private func setupConstraints() {
        bgImageView.pinEdges(to: self)
        
        labelAccountName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).activate()
        labelAccountName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).activate()
        labelAccountName.topAnchor.constraint(equalTo: topAnchor, constant: 20).activate()
        labelAccountName.heightAnchor.constraint(equalToConstant: 30).activate()
        
        LogoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).activate()
        LogoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).activate()
        LogoImageView.heightAnchor.constraint(equalToConstant: 50).activate()
        LogoImageView.widthAnchor.constraint(equalTo: LogoImageView.heightAnchor, multiplier: 1.3).activate()
        
        labelBalance.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).activate()
        labelBalance.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).activate()
        labelBalance.heightAnchor.constraint(equalToConstant: 30).activate()
        labelBalance.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
        
        labelAccountNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).activate()
        labelAccountNumber.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).activate()
        labelAccountNumber.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).activate()
        labelAccountNumber.heightAnchor.constraint(equalToConstant: 30).activate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


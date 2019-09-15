//
//  TransactionViewController.swift
//  MyWallet
//
//  Created by Adil Bougamza on 15/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController {

    var viewModel: TransactionViewModel!
    let balanceBeforelabale: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    let balanceAfterlabale: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    let descriptionLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        return l
    }()
    let amountLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        return l
    }()
    let accountLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let dateLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    init(viewModel: TransactionViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        
        setupView()
        setupConstraints()
    }
    
    fileprivate func styleView() {
        dateLabel.font = AppStyle.Font.regular(15)
        dateLabel.textColor = AppStyle.Color.gray
        
        descriptionLabel.font = AppStyle.Font.bold(55)
        descriptionLabel.textColor = AppStyle.Color.black
        
        accountLabel.font = AppStyle.Font.regular(15)
        accountLabel.textColor = AppStyle.Color.gray
        
        amountLabel.font = AppStyle.Font.bold(50)
        amountLabel.textColor = viewModel.transaction.amount < 0 ?
            AppStyle.Color.flatRed : AppStyle.Color.flatGreen
    }
    
    private func setupView() {
        view.addSubview(descriptionLabel)
        view.addSubview(amountLabel)
        view.addSubview(accountLabel)
        view.addSubview(dateLabel)
        view.addSubview(balanceBeforelabale)
        view.addSubview(balanceAfterlabale)
        styleView()
        setupData()
    }
    
    private func setupData() {
        descriptionLabel.text = viewModel.transaction.description.capitalized
        amountLabel.text = viewModel.transaction.amount.formattedAmount()
        accountLabel.text = viewModel.transaction.otherAccount
        dateLabel.text = DateFormatterUtil.formattedDateForTrasaction(date: viewModel.transaction.date)
        balanceBeforelabale.text = "Balance before: \(viewModel.balanceBefore().formattedAmount(addOperator: false))"
        balanceAfterlabale.text = "Balance after: \(viewModel.balanceAfter().formattedAmount(addOperator: false))"
    }
    
    private func setupConstraints() {
        let edgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20)

        dateLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).activate()
        dateLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor).activate()
        dateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).activate()
        
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: edgeInsets.left).activate()
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: edgeInsets.right).activate()
        descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor).activate()
        
        accountLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).activate()
        accountLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor).activate()
        accountLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 0).activate()

        balanceBeforelabale.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).activate()
        balanceBeforelabale.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor).activate()
        balanceBeforelabale.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 10).activate()
        
        amountLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).activate()
        amountLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor).activate()
        amountLabel.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 20).activate()
        
        balanceAfterlabale.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).activate()
        balanceAfterlabale.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor).activate()
        balanceAfterlabale.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 10).activate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = AppStyle.Color.white
    }
}

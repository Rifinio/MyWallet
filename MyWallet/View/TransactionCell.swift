//
//  TransactionCell.swift
//  MyWallet
//
//  Created by Adil Bougamza on 15/09/2019.
//  Copyright © 2019 Adil Bougamza. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description"
        return label
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "date"
        return label
    }()
    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "-999.0"
        return label
    }()
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstraints()
        styleComponents()
    }
    
    private func setupView() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(amountLabel)
        contentView.addSubview(dateLabel)
    }
    
    private func setupConstraints() {
        iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).activate()
        iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).activate()
        iconImageView.heightAnchor.constraint(equalToConstant: 30).activate()
        iconImageView.widthAnchor.constraint(equalToConstant: 30).activate()
        
        amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).activate()
        amountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).activate()
        amountLabel.heightAnchor.constraint(equalToConstant: 40).activate()
        amountLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/5).activate()
        
        descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10).activate()
        descriptionLabel.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: 10).activate()
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor).activate()
        
        dateLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).activate()
        dateLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 10).activate()
        dateLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor).activate()
    }
    
    private func styleComponents() {
        descriptionLabel.font = AppStyle.Font.regular(15)
        descriptionLabel.textColor = AppStyle.Color.black
        
        dateLabel.font = AppStyle.Font.light(14)
        dateLabel.textColor = AppStyle.Color.gray
        
        amountLabel.font = AppStyle.Font.bold(17)
        amountLabel.textColor = AppStyle.Color.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

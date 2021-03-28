//
//  EntertaimentTableViewCell.swift
//  Leisure
//
//  Created by Дмитрий Куликов on 24.03.2021.
//

import UIKit

class EntertaimentTableViewCell: UITableViewCell {
    private let typeLabel = UILabel()
    private let titleLabel = UILabel()
    private let iconImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [typeLabel, titleLabel, iconImageView].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconImageView.pin
            .bottom(8)
            .left(20)
            .height(64)
            .width(64)
        
        titleLabel.pin
          //  .bottom(8)
            .after(of: iconImageView)
            .sizeToFit()
            //.marginLeft(8)
            //.sizeToFit(.width)
    }
    
    func configure(with model: Entertainment) {
        typeLabel.text = model.type
        titleLabel.text = model.name
        iconImageView.image = UIImage(systemName: model.imagePath)
    }
    
}


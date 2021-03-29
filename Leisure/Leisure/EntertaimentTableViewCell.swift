//
//  EntertaimentTableViewCell.swift
//  Leisure
//
//  Created by Дмитрий Куликов on 24.03.2021.
//

import UIKit

class EntertaimentTableViewCell: UITableViewCell {
   // private let typeLabel = UILabel()
    private let titleLabel = UILabel()
    private let iconImageView = UIImageView()
    private let costLabel = UILabel()
    private let typeImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        titleLabel.font = .systemFont(ofSize: 25, weight: .light)
        costLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        costLabel.textColor = .lightGray
        titleLabel.numberOfLines = 0
        iconImageView.layer.cornerRadius = 20
        iconImageView.clipsToBounds = true
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        
        
        [titleLabel, iconImageView, costLabel, typeImage].forEach {
            contentView.addSubview($0)
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 100, left: 10, bottom: 100, right: 10))
        
        iconImageView.pin
            .bottom()
            .left()
            .size(120)
         
            
        titleLabel.pin
            .top(-20)
            .height(80)
            .after(of: iconImageView)
            //.width(150)
            .sizeToFit(.height)
            .maxHeight(100)
            //.sizeToFit(.width)

        costLabel.pin
            .right(12)
            .height(64)
            .bottom(-15)
            .sizeToFit(.height)
        
        typeImage.pin
            .size(24)
            .after(of: iconImageView, aligned: .center)
            .below(of: titleLabel)

    
    }
    
    
//    override func awakeFromNib() {
//            super.awakeFromNib()
//        layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 48, right: 0)
//    }
    
    func configure(with model: Entertainment) {
        titleLabel.text = model.name
        iconImageView.image = model.getImage()
        costLabel.text = model.cost != 0 ? "\(model.cost) ₽" : "Бесплатно"
        typeImage.image = UIImage(systemName: "pencil")
    }
    
}


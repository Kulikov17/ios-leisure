import UIKit
import Kingfisher

class EntertaimentTableViewCell: UITableViewCell {
    private let typeLabel = UILabel()
    private let titleLabel = UILabel()
    private let iconImageView = UIImageView()
    private let costLabel = UILabel()
    private let containerView = UIView()
    private let age_restriction = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        iconImageView.kf.cancelDownloadTask()
    }
    
    private func setup() {
        
        titleLabel.font = .systemFont(ofSize: 17, weight: .medium)
        costLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        typeLabel.font = .systemFont(ofSize: 15, weight: .thin)
        costLabel.textColor = .lightGray
        typeLabel.textColor = .red
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.clipsToBounds = true
        costLabel.numberOfLines = 0
     
        containerView.layer.cornerRadius = 10
        
        containerView.clipsToBounds = true
        
        containerView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        
        
        
        [titleLabel, iconImageView, costLabel, typeLabel].forEach {
            containerView.addSubview($0)
        }
        
        contentView.addSubview(containerView)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.pin
            .left(15)
            .right(15)
            .top(8)
            .bottom(8)
        
        iconImageView.pin
            .left()
            .size(120)
            .vCenter()
            
        titleLabel.pin
            .top(30)
            .after(of: iconImageView)
            .marginLeft(8)
            .right(12)
            .sizeToFit(.width)

        costLabel.pin
            .right(12)
            .height(16)
            .bottom(8)
            .sizeToFit(.height)

        typeLabel.pin
            .height(16)
            .bottom(12)
            .after(of: iconImageView)
            .marginLeft(8)
            .sizeToFit(.height)
            
            
    }
    
    func configure(with model: PosterViewModel) {
        titleLabel.text = model.short_title
        iconImageView.kf.setImage(with: URL(string: model.image ?? ""))
        costLabel.text = model.is_free ? "Бесплатно" : "\(String(describing: model.price ?? ""))"
        typeLabel.text = model.category
        print(model.age_restriction)
        
    }
    
}


import UIKit
import Kingfisher
import PinLayout

class DetailView: UIView {
    private var poster: PosterViewModel?
    //private let titleLabel = UILabel()
    private let shortTitleLabel = UILabel()
    private let addressLabel = UILabel()
    private let descriptionLabel = UITextView()
    //private let ageRestrictionLabel = UILabel()
    private let priceLabel = UILabel()
    private let iconImageView = UIImageView()
    private let containerView = UIView()
    let buttonUrl = UIButton(frame: CGRect(x: 100,
                                        y: 100,
                                        width: 200,
                                        height: 60))
    let buttonFavorites = UIButton(frame: CGRect(x: 100,
                                        y: 100,
                                        width: 60,
                                        height: 60))
    init(poster: PosterViewModel) {
        self.poster = poster
        super.init(frame: UIScreen.main.bounds)
        setup()
        configure()
        print("\(poster.category)")

           return;
       }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        containerView.clipsToBounds = true
    
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.clipsToBounds = true
        addressLabel.numberOfLines = 0
        shortTitleLabel.numberOfLines = 0
        shortTitleLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        addressLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        priceLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        descriptionLabel.font = .systemFont(ofSize: 17, weight: .light)
        buttonUrl.setTitle("Перейти на сайт", for: .normal)
        buttonUrl.setTitleColor(.systemGray6,for: .normal)
        buttonUrl.addTarget(self,action: #selector(buttonUrlAction),
                         for: .touchUpInside)
        
        buttonUrl.backgroundColor = #colorLiteral(red: 0.4392156899, green:
                                                    0.01176470611, blue: 0.1921568662, alpha: 0.8)
      
//        buttonFavorites.setImage(UIImage(named: "aibo.png"), for: .normal)
//             // for Highlighted state
//        buttonFavorites.setImage(UIImage(named: "bmth.png"), for: .highlighted)
//
//                // for Selected state
//        buttonFavorites.setImage(UIImage(named: "bpb.png"), for: .reserved)
        
        
        [shortTitleLabel, addressLabel, descriptionLabel, priceLabel, iconImageView, buttonUrl].forEach {
            containerView.addSubview($0)
        }
        self.addSubview(containerView)
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.pin
            .left(15)
            .right(15)
            .top(100)
            .bottom(8)
        
        iconImageView.pin
            .size(250)
            .top(5)
            .hCenter()
        
        shortTitleLabel.pin
            .below(of: iconImageView)
            .margin(10)
            .left(20)
            .right(20)
            .sizeToFit(.width)
        
        addressLabel.pin
            
            .below(of: shortTitleLabel)
            .margin(10)
            .left(20)
            .right(20)
            .sizeToFit(.width)
        
        priceLabel.pin
            .below(of: addressLabel)
            .margin(10)
            .left(20)
            .right(20)
            .sizeToFit(.width)
        
        descriptionLabel.pin
            .below(of: priceLabel)
            .margin(10)
            .left(10)
            .right(10)
            .sizeToFit(.width)
        
        buttonUrl.pin
            .below(of: descriptionLabel)
            .margin(10)
            .left(10)
            .right(10)
            .sizeToFit(.width)

    
    }
    
    func configure() {
        shortTitleLabel.text = poster?.title
        addressLabel.text = poster?.address
        descriptionLabel.text = poster?.description
        priceLabel.text = poster?.price
        iconImageView.kf.setImage(with: URL(string: poster?.image ?? ""))
        //ageRestrictionLabel.text = poster?.age_restriction?.?
        
    }
    
    @objc
    func buttonUrlAction() {  //переписать на WKWebView
        guard let url = URL(string: poster?.site_url ?? "") else {
            return
        }
        UIApplication.shared.open(url)
    }
    
    @objc
    func buttonFavoritesAction() {
        print("Button Favorites pressed")
    }
}

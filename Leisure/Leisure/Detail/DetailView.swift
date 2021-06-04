import UIKit
import Kingfisher
import PinLayout
import Firebase
import FirebaseDatabase

class DetailView: UIView {
    private var poster: PosterViewModel?
    private let titleLabel = UILabel()
    private let addressLabel = UILabel()
    private let descriptionLabel = UITextView()
    private let priceLabel = UILabel()
    private let iconImageView = UIImageView()
    private let containerView = UIView()
    private let ageRestrictionLabel = UILabel()
    private let categoryLabel = UITextView()
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
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        addressLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        priceLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        descriptionLabel.font = .systemFont(ofSize: 17, weight: .light)
        descriptionLabel.isEditable = false
        buttonUrl.setTitle("Перейти на сайт", for: .normal)
        buttonUrl.setTitleColor(.systemGray6,for: .normal)
        buttonUrl.addTarget(self,action: #selector(buttonUrlAction),
                         for: .touchUpInside)
        
        buttonUrl.backgroundColor = #colorLiteral(red: 0.4392156899, green:
                                                    0.01176470611, blue: 0.1921568662, alpha: 0.8)
        ageRestrictionLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        categoryLabel.font = .systemFont(ofSize: 15, weight: .thin)
        categoryLabel.textColor = .red
        categoryLabel.isEditable = false
      
       
        buttonFavorites.setTitleColor(.systemGray6,for: .normal)
        buttonFavorites.addTarget(self,action: #selector(buttonFavoritesAction),
                         for: .touchUpInside)
        
        buttonFavorites.backgroundColor = #colorLiteral(red: 0.4392156899, green:
                                                    0.01176470611, blue: 0.1921568662, alpha: 0.8)
//        buttonFavorites.setImage(UIImage(named: "aibo.png"), for: .normal)
//             // for Highlighted state
//        buttonFavorites.setImage(UIImage(named: "bmth.png"), for: .highlighted)
//
//                // for Selected state
//        buttonFavorites.setImage(UIImage(named: "bpb.png"), for: .reserved)
        
        
        [titleLabel, addressLabel, descriptionLabel, priceLabel, iconImageView, buttonUrl, buttonFavorites, ageRestrictionLabel, categoryLabel].forEach {
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
        
        titleLabel.pin
            .below(of: iconImageView)
            .margin(10)
            .left(10)
            .right(10)
            .sizeToFit(.width)
        
        addressLabel.pin
            
            .below(of: titleLabel)
            .margin(10)
            .left(10)
            .right(10)
            .sizeToFit(.width)
        
        priceLabel.pin
            .below(of: addressLabel)
            .margin(10)
            .left(10)
            .right(10)
            .sizeToFit(.width)
        
        ageRestrictionLabel.pin
            .below(of: priceLabel)
            .margin(10)
            .left(10)
            .right(10)
            .sizeToFit(.width)
        
        descriptionLabel.pin
            .below(of: ageRestrictionLabel)
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
        
        categoryLabel.pin
            .below(of: buttonUrl)
            .margin(10)
            .left(10)
            .right(10)
            .sizeToFit(.width)
        
        buttonFavorites.pin
            .below(of: categoryLabel)
            .margin(10)
            .left(10)
            .right(10)
            .sizeToFit(.width)
    }
    
    
    func description_standartization(description: String) -> String{
        guard let startOfStr = description.firstIndex(of: ">") else { return description }
        let start = description.index(after: startOfStr)
        guard let endOfStr = description.lastIndex(of: "<") else { return description }
        let end = description.index(before: endOfStr)
        return String(description[start...end])
        
    }
    
    func configure() {
        titleLabel.text = poster?.title
        addressLabel.text = poster?.address
        if addressLabel.text == "" || ((poster?.address) == nil){
            addressLabel.text = "Адрес не указан"
        }
        
        
        descriptionLabel.text = description_standartization(description: poster?.description ?? "")
        
        
        priceLabel.text = poster?.price
        if priceLabel.text == "" || ((poster?.price) == nil){
            priceLabel.text = "Цена не указана"
        }
        if ((poster?.is_free) != nil && poster!.is_free){
            priceLabel.text = "Бесплатно"
        }

        iconImageView.kf.setImage(with: URL(string: poster?.image ?? ""))
        
        let t = poster?.age_restriction
        let k = t as? String
        ageRestrictionLabel.text = "Возрастное ограничение: \(k ?? "")"
        if (k ?? "") == "0" || (k ?? "") == ""{
            ageRestrictionLabel.text =  "Возрастное ограничение: 0+"
        }
        
        categoryLabel.text = ""
        for category in poster?.category ?? [] {
            categoryLabel.text! += category + "  "
        }
        
        Auth.auth().addStateDidChangeListener { (auth, user)  in
            if user != nil {
                self.buttonFavorites.isHidden = false
                let ref = Database.database(url: "https://leisure-18c1e-default-rtdb.europe-west1.firebasedatabase.app").reference()
                
                let groupsRef = ref.child("users/"+user!.uid + "/groups/" + "\(self.poster!.id)")
                
                groupsRef.observeSingleEvent(of: .value)
                { (snapshot) in
                    let name = snapshot.value as? [String: Any]
                    print(name)
                    if (name != nil) {
                        self.buttonFavorites.setTitle("Удалить из избранного", for: .normal)
                    } else {
                        self.buttonFavorites.setTitle("Добавить в избранное", for: .normal)
                    }
                }
            } else {
                self.buttonFavorites.isHidden = true
            }
        }
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
        Auth.auth().addStateDidChangeListener { (auth, user)  in
            if user != nil {
                let ref = Database.database(url: "https://leisure-18c1e-default-rtdb.europe-west1.firebasedatabase.app").reference()
                
                let groupsRef = ref.child("users/"+user!.uid + "/groups/")
                
                if (self.buttonFavorites.currentTitle == "Добавить в избранное") {
                    let newPost = ["id": "\(self.poster!.id)", "address": self.poster!.address, "short_title" : self.poster!.short_title,
                        "title" : self.poster!.title, "description" : self.poster!.description, "category" : self.poster!.category,
                        "price": self.poster!.price, "is_free": "\(self.poster!.is_free)",
                        "image": self.poster!.image, "age_restriction": self.poster!.age_restriction, "site_url": self.poster!.site_url]
                    
                    
                
                    groupsRef.child("\(self.poster!.id)").setValue(newPost)
                    self.buttonFavorites.setTitle("Удалить из избранного", for: .normal)
                } else {
                    groupsRef.child("\(self.poster!.id)").removeValue()
                    self.buttonFavorites.setTitle("Добавить в избранное", for: .normal)
                }
            }
        }
    }
}

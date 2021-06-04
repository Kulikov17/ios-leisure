import UIKit
import Kingfisher
import PinLayout
import Firebase

class ProfileView: UIView {
    private var output: ProfileViewOutput?
    
    let username = UILabel()
    
    let info = UILabel()
    
   
    
    let buttonLogout = UIButton(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 200,
                                        height: 40))
    
    private let containerView = UIView()
    
    init(output: ProfileViewOutput) {
        super.init(frame: UIScreen.main.bounds)
        self.output = output
        setup()
        configure()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        containerView.clipsToBounds = true
        
        buttonLogout.setTitle("Выйти", for: .normal)
        buttonLogout.setTitleColor(.systemGray6,for: .normal)
        buttonLogout.backgroundColor = .systemPink
        buttonLogout.layer.cornerRadius = 12
        buttonLogout.addTarget(self,action: #selector(buttonLogoutAction),
                         for: .touchUpInside)
        
        username.font = .systemFont(ofSize: 20, weight: .heavy)
        username.numberOfLines = 0
        
        info.font = .systemFont(ofSize: 18, weight: .semibold)
        info.textColor = .black
        
     
        
        
        
        
        [buttonLogout, username, info].forEach {
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
        
        username.pin
            .hCenter()
            .size(300)
            
        
        info.pin
            .below(of: username)
            .left(10)
            .right(10)
            .sizeToFit(.width)
           
          
           
        
            

            
        
            
        
        buttonLogout.pin
            .hCenter()
            .top(650)
    }
    
    func configure() {
        info.text = "Добавляйте места и события в избранное!"
       
        
        Auth.auth().addStateDidChangeListener { (auth, user)  in
            if user != nil {
                self.username.text = "Здравствуйте, \(user?.email as? String ?? "") !"
            }
        }
    }
    
    @objc
    func buttonLogoutAction() {
        self.output?.didTapLogout()
    }
}


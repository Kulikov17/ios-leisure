import UIKit
import Kingfisher
import PinLayout

class ProfileView: UIView {
    private var output: ProfileViewOutput?
    
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
        
        [buttonLogout].forEach {
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
        
        
        buttonLogout.pin
            .hCenter()
    }
    
    func configure() {
    }
    
    @objc
    func buttonLogoutAction() {
        self.output?.didTapLogout()
    }
}


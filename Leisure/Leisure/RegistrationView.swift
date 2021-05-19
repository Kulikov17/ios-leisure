import UIKit
import Kingfisher
import PinLayout

class RegistrationView: UIView {
    private var output: ProfileViewOutput?
    
    private let userField = UITextField(frame: CGRect(x: 0,
                                                y: 0,
                                                width: 300,
                                                height: 60))
    private let loginField = UITextField(frame: CGRect(x: 0,
                                                y: 0,
                                                width: 300,
                                                height: 60))
    private let passwordField = UITextField(frame: CGRect(x: 0,
                                                y: 0,
                                                width: 300,
                                                height: 60))
    
    private let buttonSignUp = UIButton(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 200,
                                        height: 40))
    private let buttonBack = UIButton(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 50,
                                        height: 50))
    
    
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
        
        userField.font = .systemFont(ofSize: 14, weight: .light)
        userField.layer.borderColor = UIColor.black.withAlphaComponent(0.45).cgColor
        userField.layer.borderWidth = 0.25
        userField.layer.cornerRadius = 12
        userField.clipsToBounds = false
        userField.layer.shadowOpacity=0.4
        userField.layer.shadowOffset = CGSize(width: 0, height: 0)
        userField.indent(size: 10)
        
        loginField.font = .systemFont(ofSize: 14, weight: .light)
        loginField.layer.borderColor = UIColor.black.withAlphaComponent(0.45).cgColor
        loginField.layer.borderWidth = 0.25
        loginField.layer.cornerRadius = 12
        loginField.clipsToBounds = false
        loginField.layer.shadowOpacity=0.4
        loginField.layer.shadowOffset = CGSize(width: 0, height: 0)
        loginField.indent(size: 10)
        
        passwordField.font = .systemFont(ofSize: 14, weight: .light)
        passwordField.layer.borderColor = UIColor.black.withAlphaComponent(0.45).cgColor
        passwordField.layer.borderWidth = 0.25
        passwordField.layer.cornerRadius = 12
        passwordField.clipsToBounds = false
        passwordField.layer.shadowOpacity=0.4
        passwordField.layer.shadowOffset = CGSize(width: 0, height: 0)
        passwordField.indent(size: 10)
        
        buttonSignUp.setTitle("Создать", for: .normal)
        buttonSignUp.setTitleColor(.systemGray6,for: .normal)
        buttonSignUp.backgroundColor = .systemPink
        buttonSignUp.layer.cornerRadius = 12
        buttonSignUp.addTarget(self,action: #selector(buttonSignUpAction),
                         for: .touchUpInside)
        
        buttonBack.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        buttonBack.setTitleColor(.systemGray6,for: .normal)
        buttonBack.backgroundColor = .systemGray6
        buttonBack.layer.cornerRadius = 25
        buttonBack.addTarget(self,action: #selector(buttonBackAction),
                         for: .touchUpInside)
        
      
        
        
        [userField, loginField, passwordField, buttonSignUp, buttonBack].forEach {
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
        
        userField.pin
            .hCenter()
            .top(self.frame.height / 4)
        
        loginField.pin
            .hCenter()
            .below(of: userField)
            .margin(10)
        
        passwordField.pin
            .hCenter()
            .below(of: loginField)
            .margin(10)
        
        buttonSignUp.pin
            .hCenter()
            .below(of: passwordField)
            .margin(20)
    }
    
    func configure() {
        userField.placeholder = "Введите имя"
        loginField.placeholder = "Введите почту или телефон"
        passwordField.placeholder = "Введите пароль"
    }
    
    
    @objc
    func buttonSignUpAction() {
        let user = userField.text!
        let login = loginField.text!
        let password = passwordField.text!
        
        if (!user.isEmpty && !login.isEmpty && !password.isEmpty) {
            self.output?.didTapCreateUser(user: user, login: login, password: password)
        }
        
    }
    
    @objc
    func buttonBackAction() {
        self.output?.didTapBack()
    }
}

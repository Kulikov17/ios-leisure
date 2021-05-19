import UIKit
import Kingfisher
import PinLayout

class LoginView: UIView {
    private var output: ProfileViewOutput?
    
    private let loginField = UITextField(frame: CGRect(x: 0,
                                                y: 0,
                                                width: 300,
                                                height: 60))
    private let passwordField = UITextField(frame: CGRect(x: 0,
                                                y: 0,
                                                width: 300,
                                                height: 60))
    
    let buttonSignIn = UIButton(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 200,
                                        height: 40))
    
    private let signUpTitleLabel = UILabel(frame: CGRect(x: 0,
                                                         y: 0,
                                                         width: 100,
                                                         height: 40))
    let buttonSignUp = UIButton(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 100,
                                        height: 20))
    
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
        
        
        buttonSignIn.setTitle("Войти", for: .normal)
        buttonSignIn.setTitleColor(.systemGray6,for: .normal)
        buttonSignIn.backgroundColor = .systemPink
        buttonSignIn.layer.cornerRadius = 12
        buttonSignIn.addTarget(self,action: #selector(buttonSignInAction),
                         for: .touchUpInside)
        
        signUpTitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        signUpTitleLabel.textColor = .black
        
        buttonSignUp.setTitle("Создать", for: .normal)
        buttonSignUp.setTitleColor(.systemBlue,for: .normal)
        buttonSignUp.backgroundColor = self.backgroundColor
        buttonSignUp.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        buttonSignUp.addTarget(self,action: #selector(buttonSignUpAction),
                         for: .touchUpInside)
      
        
        
        [loginField, passwordField, buttonSignIn, signUpTitleLabel, buttonSignUp].forEach {
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
        
        loginField.pin
            .hCenter()
            .top(self.frame.height / 4)
        
        passwordField.pin
            .hCenter()
            .below(of: loginField)
            .margin(10)
        
        buttonSignIn.pin
            .hCenter()
            .below(of: passwordField)
            .margin(20)
        
        
        buttonSignUp.pin
            .left(self.frame.width / 2 - 10)
            .below(of: buttonSignIn)
            .margin(10)
        
        signUpTitleLabel.pin
            .left(self.frame.width / 4)
            .below(of: buttonSignIn)
            
        
    }
    
    func configure() {
        loginField.placeholder = "Введите почту или телефон"
        passwordField.placeholder = "Введите пароль"
        signUpTitleLabel.text = "Нет аккаунта?"
    }
    
    @objc
    func buttonSignUpAction() {
        self.output?.didTapSignUp()
    }
    
    @objc
    func buttonSignInAction() {
        let login = loginField.text!
        let password = passwordField.text!
        
        if (!login.isEmpty && !password.isEmpty) {
            self.output?.didTapLogin(login: login, password: password)
        }
        
    }
}


extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

import UIKit
import Kingfisher
import PinLayout

class LoginView: UIView {
    private var output: ProfileViewOutput?
    
    
    private let loginFieldRegister = UITextField(frame: CGRect(x: 0,
                                                y: 0,
                                                width: 300,
                                                height: 60))
    private let passwordFieldRegister = UITextField(frame: CGRect(x: 0,
                                                y: 0,
                                                width: 300,
                                                height: 60))
    
    private let buttonSignUpRegister = UIButton(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 200,
                                        height: 40))
    private let buttonBack = UIButton(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 50,
                                        height: 50))
    
    
    private let containerViewRegister = UIView()
    
    
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
    
    private let buttonExit = UIButton(frame: CGRect(x: 0,
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
        
        loginField.font = .systemFont(ofSize: 14, weight: .light)
        loginField.layer.borderColor = UIColor.black.withAlphaComponent(0.45).cgColor
        loginField.layer.borderWidth = 0.25
        loginField.layer.cornerRadius = 12
        loginField.clipsToBounds = false
        loginField.layer.shadowOpacity=0.4
        loginField.layer.shadowOffset = CGSize(width: 0, height: 0)
        loginField.autocapitalizationType = .none
        loginField.autocorrectionType = .no
        loginField.spellCheckingType = .no
        loginField.indent(size: 10)
        
        passwordField.font = .systemFont(ofSize: 14, weight: .light)
        passwordField.isSecureTextEntry = true
        passwordField.layer.borderColor = UIColor.black.withAlphaComponent(0.45).cgColor
        passwordField.layer.borderWidth = 0.25
        passwordField.layer.cornerRadius = 12
        passwordField.clipsToBounds = false
        passwordField.layer.shadowOpacity=0.4
        passwordField.layer.shadowOffset = CGSize(width: 0, height: 0)
        passwordField.autocapitalizationType = .none
        passwordField.autocorrectionType = .no
        passwordField.spellCheckingType = .no
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
      
        
        buttonExit.setImage(UIImage(systemName: "xmark"), for: .normal)
        buttonExit.setTitleColor(.systemGray6,for: .normal)
        buttonExit.backgroundColor = .systemGray6
        buttonExit.layer.cornerRadius = 25
        buttonExit.addTarget(self,action: #selector(buttonExitAction),
                         for: .touchUpInside)
        
        [loginField, passwordField, buttonSignIn, signUpTitleLabel, buttonSignUp, buttonExit].forEach {
            containerView.addSubview($0)
        }
        
        self.addSubview(containerView)
        
        containerViewRegister.clipsToBounds = true
        
        
        loginFieldRegister.font = .systemFont(ofSize: 14, weight: .light)
        loginFieldRegister.layer.borderColor = UIColor.black.withAlphaComponent(0.45).cgColor
        loginFieldRegister.layer.borderWidth = 0.25
        loginFieldRegister.layer.cornerRadius = 12
        loginFieldRegister.clipsToBounds = false
        loginFieldRegister.layer.shadowOpacity=0.4
        loginFieldRegister.layer.shadowOffset = CGSize(width: 0, height: 0)
        loginFieldRegister.indent(size: 10)
        loginFieldRegister.autocapitalizationType = .none
        loginFieldRegister.autocorrectionType = .no
        loginFieldRegister.spellCheckingType = .no
        
        passwordFieldRegister.font = .systemFont(ofSize: 14, weight: .light)
        passwordFieldRegister.isSecureTextEntry = true
        passwordFieldRegister.layer.borderColor = UIColor.black.withAlphaComponent(0.45).cgColor
        passwordFieldRegister.layer.borderWidth = 0.25
        passwordFieldRegister.layer.cornerRadius = 12
        passwordFieldRegister.clipsToBounds = false
        passwordFieldRegister.layer.shadowOpacity=0.4
        passwordFieldRegister.layer.shadowOffset = CGSize(width: 0, height: 0)
        passwordFieldRegister.indent(size: 10)
        passwordFieldRegister.autocapitalizationType = .none
        passwordFieldRegister.autocorrectionType = .no
        passwordFieldRegister.spellCheckingType = .no
        
        buttonSignUpRegister.setTitle("Создать", for: .normal)
        buttonSignUpRegister.setTitleColor(.systemGray6,for: .normal)
        buttonSignUpRegister.backgroundColor = .systemPink
        buttonSignUpRegister.layer.cornerRadius = 12
        buttonSignUpRegister.addTarget(self,action: #selector(buttonSignUpRegisterAction),
                         for: .touchUpInside)
        
        buttonBack.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        buttonBack.setTitleColor(.systemGray6,for: .normal)
        buttonBack.backgroundColor = .systemGray6
        buttonBack.layer.cornerRadius = 25
        buttonBack.addTarget(self,action: #selector(buttonBackAction),
                         for: .touchUpInside)
        
      
        
        
        [loginFieldRegister, passwordFieldRegister, buttonSignUpRegister, buttonBack].forEach {
            containerViewRegister.addSubview($0)
        }
        
        self.addSubview(containerViewRegister)
        self.containerViewRegister.isHidden = true
        
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
        
        
        containerViewRegister.pin
            .left(15)
            .right(15)
            .top(100)
            .bottom(8)
        
        
        loginFieldRegister.pin
            .hCenter()
            .top(self.frame.height / 4)
        
        passwordFieldRegister.pin
            .hCenter()
            .below(of: loginFieldRegister)
            .margin(10)
        
        buttonSignUpRegister.pin
            .hCenter()
            .below(of: passwordFieldRegister)
            .margin(20)
            
        
    }
    
    func configure() {
        loginField.placeholder = "Введите почту"
        passwordField.placeholder = "Введите пароль"
        signUpTitleLabel.text = "Нет аккаунта?"
        loginFieldRegister.placeholder = "Введите почту"
        passwordFieldRegister.placeholder = "Введите пароль"
    }
    
    @objc
    func buttonSignUpAction() {
        self.containerView.isHidden = true
        self.containerViewRegister.isHidden = false
    }
    
    @objc
    func buttonSignUpRegisterAction() {
        let login = loginFieldRegister.text!
        let password = passwordFieldRegister.text!
        
        if (!login.isEmpty && !password.isEmpty) {
            self.output?.didTapCreateUser(login: login, password: password)
        }
        
    }
    
    @objc
    func buttonSignInAction() {
        let login = loginField.text!
        let password = passwordField.text!
        
        if (!login.isEmpty && !password.isEmpty) {
            self.output?.didTapLogin(login: login, password: password)
        }
        
    }
    
    @objc
    func buttonExitAction() {
        self.output?.didTapExitAuth()
    }
    
    @objc
    func buttonBackAction() {
        self.containerView.isHidden = false
        self.containerViewRegister.isHidden = true
    }
}


extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

import UIKit
import PinLayout

final class ProfileViewController: UIViewController {
    private let output: ProfileViewOutput
    
    private let loginView: LoginView
    private let profileView: ProfileView
    private let registrationView: RegistrationView
    
    init(output: ProfileViewOutput) {
        self.output = output
        self.loginView = LoginView(output: self.output)
        self.profileView = ProfileView(output: self.output)
        self.registrationView = RegistrationView(output: self.output)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [loginView, registrationView, profileView].forEach {
            view.addSubview($0)
        }
        
        view.subviews.forEach { subview in
            subview.isHidden = false
        }
        
        output.didLoadView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension ProfileViewController: ProfileViewInput {
}

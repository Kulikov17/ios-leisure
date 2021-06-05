import UIKit
import PinLayout

final class ProfileViewController: UIViewController {
    private let output: ProfileViewOutput
    
    private let profileView: ProfileView
    
    private var nav = UINavigationController()
    
    init(output: ProfileViewOutput) {
        self.output = output
        self.profileView = ProfileView(output: self.output)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        output.didLoadView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output.didLoadView()
    }
}

extension ProfileViewController: ProfileViewInput {
    
    func showLoginView() {
        let loginViewController = LoginViewController(output: self.output)
        let navigationController = UINavigationController(rootViewController: loginViewController)
        navigationController.modalPresentationStyle = .fullScreen
        self.nav = navigationController
        
        present(navigationController, animated: true, completion: nil)
       
    }
    
    func showAlertErrorMessage(with message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.nav.present(alert, animated: false, completion: nil)
        
    }
    
    func closeLoginView() {
        self.dismiss(animated: true, completion: nil)
        self.output.didLoadPosterView()
    }
    
    func showProfileView() {
        self.dismiss(animated: true, completion: nil)
        view = ProfileView(output: self.output)
    }
    
    func closeProfileView() {
        view = UIView()
        view.backgroundColor = .systemBackground
    }
    
}

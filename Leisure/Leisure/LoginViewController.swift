import Foundation

import UIKit
import PinLayout

final class LoginViewController: UIViewController {
    private let output: ProfileViewOutput
    private let loginView: LoginView
    
    init(output: ProfileViewOutput) {
        self.output = output
        self.loginView = LoginView(output: output)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
}

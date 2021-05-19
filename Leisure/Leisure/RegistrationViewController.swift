import Foundation

import UIKit
import PinLayout

final class RegistrationViewController: UIViewController {
    private let output: ProfileViewOutput
    private let registrationView: RegistrationView
    
    init(output: ProfileViewOutput) {
        self.output = output
        self.registrationView = RegistrationView(output: output)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(registrationView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}


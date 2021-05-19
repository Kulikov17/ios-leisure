import UIKit

final class ProfileRouter {
    weak var sourceViewController: UIViewController?
    weak var soursePresenter: ProfileViewOutput?
}

extension ProfileRouter: ProfileRouterInput {
    func showLoginView() {
        sourceViewController?.title = "Авторизация"
        sourceViewController?.view.subviews.forEach { subview in
            if ((subview as? LoginView) != nil) {
                subview.isHidden = false
            } else {
                subview.isHidden = true
            }
        }
    }
    
    func showAccountView() {
        sourceViewController?.title = "Профиль"
        sourceViewController?.view.subviews.forEach { subview in
            if ((subview as? ProfileView) != nil) {
                subview.isHidden = false
            } else {
                subview.isHidden = true
            }
        }
    }
    
    func showRegistrationView() {
        sourceViewController?.view.subviews.forEach { subview in
            if ((subview as? RegistrationView) != nil) {
                subview.isHidden = false
            } else {
                subview.isHidden = true
            }
        }
        //sourceViewController?.title = "Авторизация"
        //let registrationViewController = RegistrationViewController(output: soursePresenter!)
        //sourceViewController?.navigationController?.pushViewController(registrationViewController, animated: true)
    }
    
}

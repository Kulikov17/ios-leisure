import Foundation
import Firebase

final class ProfilePresenter {
	weak var view: ProfileViewInput?

	private let router: ProfileRouterInput
	private let interactor: ProfileInteractorInput

    init(router: ProfileRouterInput, interactor: ProfileInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ProfilePresenter: ProfileViewOutput {

    func didLoadPosterView() {
        self.router.showPosterView()
    }
    
    func didTapExitAuth() {
        self.view?.closeLoginView()
    }
    
    func didTapLogin(login: String, password: String) {
        self.interactor.login(login: login, password: password)
    }
    
    func didTapLogout() {
        self.interactor.logout()
        self.view?.closeProfileView()
    }
    
    func didLoadView() {
        Auth.auth().addStateDidChangeListener { (auth, user)  in
            if user != nil {
                self.view?.showProfileView()
            } else {
                self.view?.showLoginView()
            }
        }
    }
    
    func didTapCreateUser(login: String, password: String) {
        self.interactor.createUser(login: login, password: password)
    }
    
    func didLoadProfileView(info: String) {
        self.view?.showProfileView()
    }
}

extension ProfilePresenter: ProfileInteractorOutput {
    
    func didReceive(error: String) {
        view?.showAlertErrorMessage(with: error)
    }
    
    
    func didLoadProfileView() {
        self.view?.showProfileView()
    }
    
}

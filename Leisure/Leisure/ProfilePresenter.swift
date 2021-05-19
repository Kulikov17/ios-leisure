import Foundation

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
    func didTapBack() {
        self.router.showLoginView()
    }
    
    func didTapLogin(login: String, password: String) {
        self.interactor.login(login: login, password: password)
    }
    
    func didTapLogout() {
        self.interactor.logout()
    }
    
    func didLoadView() {
        self.interactor.checkAuth()
    }
    
    func didTapSignUp() {
        self.router.showRegistrationView()
    }
    
    func didTapCreateUser(user: String, login: String, password: String) {
        self.interactor.createUser(user: user, login: login, password: password)
    }
}

extension ProfilePresenter: ProfileInteractorOutput {
    
    func didLoadProfileView() {
        self.router.showAccountView()
    }
    
    func didLoadLoginView() {
        self.router.showLoginView()
    }
    
}

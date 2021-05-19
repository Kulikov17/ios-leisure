import Foundation

protocol ProfileViewInput: AnyObject {
}

protocol ProfileViewOutput: AnyObject {
    func didLoadView()
    func didTapSignUp()
    func didTapBack()
    func didTapCreateUser(user: String, login: String, password: String)
    func didTapLogout()
    func didTapLogin(login: String, password: String)
}

protocol ProfileInteractorInput: AnyObject {
    func checkAuth()
    func createUser(user: String, login: String, password: String)
    func logout()
    func login(login: String, password: String)
}

protocol ProfileInteractorOutput: AnyObject {
    func didLoadView()
    func didLoadProfileView()
    func didLoadLoginView()
}

protocol ProfileRouterInput: AnyObject {
    func showLoginView()
    func showRegistrationView()
    func showAccountView()
    
}

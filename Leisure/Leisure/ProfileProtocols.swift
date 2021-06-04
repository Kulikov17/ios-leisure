import Foundation

protocol ProfileViewInput: AnyObject {
    func showProfileView()
    func closeProfileView()
    func showLoginView()
    func closeLoginView()
    func showAlertErrorMessage(with: String)
}

protocol ProfileViewOutput: AnyObject {
    func didLoadView()
    func didTapExitAuth()
    func didTapCreateUser(login: String, password: String)
    func didTapLogout()
    func didTapLogin(login: String, password: String)
    func didLoadPosterView()
}

protocol ProfileInteractorInput: AnyObject {    
    func createUser(login: String, password: String)
    func logout()
    func login(login: String, password: String)
}

protocol ProfileInteractorOutput: AnyObject {
    func didLoadProfileView()
    func didReceive(error: String)
}

protocol ProfileRouterInput: AnyObject {
    func showPosterView()
}

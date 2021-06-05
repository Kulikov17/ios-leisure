import Foundation
import Firebase

final class ProfileInteractor {
	weak var output: ProfileInteractorOutput?
}

extension ProfileInteractor: ProfileInteractorInput {
    func login(login: String, password: String) {
        Auth.auth().signIn(withEmail: login, password: password) {(result, error) in
            if error == nil {
                if let result = result {
                    self.output?.didLoadProfileView()
                }
            } else {
                let err = error as? Error
                var message: String = "Неизвестная ошибка!"
                if (err?.localizedDescription == "The email address is badly formatted.") {
                    message = "Некорректный адресс почты!"
                }
                if (err?.localizedDescription == "There is no user record corresponding to this identifier. The user may have been deleted.") {
                    message = "Пользователя с такой учетной записью не существует!"
                }
                if (err?.localizedDescription == "The password is invalid or the user does not have a password.") {
                    message = "Некорректный пароль!"
                }
                
                self.output?.didReceive(error: message)
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
    }
    
    func createUser(login: String, password: String) {
        Auth.auth().createUser(withEmail: login, password: password) {(result, error) in
            if error == nil {
                if let result = result {
                    self.output?.didLoadProfileView()
                }
            } else {
                let err = error as? Error
                var message: String = "Неизвестная ошибка!"
                if (err?.localizedDescription == "The email address is badly formatted.") {
                    message = "Некорректный адресс почты!"
                }
                if (err?.localizedDescription == "The password must be 6 characters long or more.") {
                    message = "Слабый пароль! Введите пароль длиной 6 и более."
                }
                self.output?.didReceive(error: message)
            }
        }
    }
}

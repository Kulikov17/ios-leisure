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
                    print(result.user.uid)
                }
            } else {
                print(error)
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
    
    func createUser(user: String, login: String, password: String) {
        Auth.auth().createUser(withEmail: login, password: password) {(result, error) in
            if error == nil {
                if let result = result {
                    print(result.user.uid)
                }
            } else {
                print(error)
            }
        }
    }
    
    func checkAuth() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                self.output?.didLoadLoginView()
            } else {
                self.output?.didLoadProfileView()
            }
        }
    }
}

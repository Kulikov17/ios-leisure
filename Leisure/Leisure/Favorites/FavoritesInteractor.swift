import Foundation
import Firebase
import FirebaseDatabase

final class FavoritesInteractor {
	weak var output: FavoritesInteractorOutput?
}

extension FavoritesInteractor: FavoritesInteractorInput {
    func load() {
        var posters: [PosterViewModel] = []
        Auth.auth().addStateDidChangeListener { (auth, user)  in
            if user != nil {
                let ref = Database.database(url: "https://leisure-18c1e-default-rtdb.europe-west1.firebasedatabase.app").reference()
                
                let groupsRef = ref.child("users/"+user!.uid + "/groups/")
                
                groupsRef.observeSingleEvent(of: .value)
                { (snapshot) in
                    let name = snapshot.value as? Dictionary<String, Any>
                    if (name != nil) {
                        for (key, value) in name! {
                            let value1 = value as? Dictionary<String, Any>
                            let id = value1?["id"] as? String ?? ""
                            let idNumber = Int(id) ?? 0
                            let address = value1?["address"] as? String ?? ""
                            let short_title = value1?["short_title"] as? String ?? ""
                            let title = value1?["title"] as? String ?? ""
                            let description = value1?["description"] as? String ?? ""
                            let price = value1?["price"] as? String ?? ""
                            let is_free = value1?["is_free"] as? Bool ?? true
                            let age_restriction = value1?["age_restriction"] as? Any
                            let site_url = value1?["site_url"] as? String ?? ""
                            let image = value1?["image"] as? String ?? ""
                            let category = value1?["category"] as? [String] ?? []
                           
                            var poster = PosterViewModel(id: idNumber, address: address, short_title: short_title, title: title, description: description, category: category, price: price, is_free: is_free, image: image, age_restriction: age_restriction, site_url: site_url)
                            posters.append(poster)
                        }
                    }
                    self.output?.didLoad(posters: posters)
                }
                
            }
        }
    }
    
}

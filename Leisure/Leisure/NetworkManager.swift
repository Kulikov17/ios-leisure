//import Foundation
//
//protocol NetworkManagerDescriptor: AnyObject {
//    func currentEvent(for city: String, completion: @escaping (CurrentEvent?) -> Void)
//}
//final class NetworkManager: NetworkManagerDescriptor {
//    
//    static let shared: NetworkMaanagerDescriptor = NetworkManager()
//    
//    private init() {}
//    
//    func currentEvent(for city: String, completion: @escaping (CurrentEvent?) -> Void) {
//        let urlString = "https://kudago.com/public-api/v1.3/events/?location=msk&fields=id,title,description,price"
//        
//        guard let url = URL(string: urlString) else {
//            completion(nil)
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print(error.localizedDescription)
//                completion(nil)
//            }
//            
//            guard let data = data, !data.isEmpty else {
//                print("No data")
//                completion(nil)
//                return
//            }
//            
//            let decoder = JSONDecoder()
//            
//            do {
//                //print(data)
//               // let json = try? JSONSerialization.jsonObject(with: data, options: [])
//               // print(json)
//                let currentEvent = try decoder.decode(CurrentEvent.self, from: data)
//                completion(currentEvent)
//            } catch let error {
//                print(error.localizedDescription)
//                completion(nil)
//            }
//            
//        }.resume()
//    }
//}

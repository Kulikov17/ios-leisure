import Foundation

struct Results: Codable {
    struct Place: Codable {
        let address: String?
    }
    let id: Int
    let title: String
    let description: String
    let price: String
    let place: Place?
}

struct Responce: Codable {
    let results: [Results]
}

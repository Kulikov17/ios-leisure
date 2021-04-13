import Foundation

struct Results: Codable {
    let id: Int
    let title: String
    let description: String
    let price: String
}

struct Responce: Codable {
    let results: [Results]
}

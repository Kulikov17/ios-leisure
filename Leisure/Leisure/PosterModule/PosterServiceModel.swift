import Foundation

struct PosterResults: Codable {
    struct Place: Codable {
        let address: String?
    }
    let id: Int
    let title: String
    let description: String
    let price: String
    let place: Place?
}

struct PosterResponce: Codable {
    let results: [PosterResults]
}

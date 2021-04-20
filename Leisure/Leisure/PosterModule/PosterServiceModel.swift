import Foundation

struct PosterResults: Codable {
    struct Place: Codable {
        let address: String?
    }
    struct Image: Codable {
        let image: String?
    }
    let title: String
    let short_title: String
    let place: Place?
    let description: String
    let categories: [String]
    //let age_restriction: Any
    let price: String?
    let is_free: Bool
    //let images: Image?
    let site_url: String?
}

struct PosterResponce: Codable {
    let results: [PosterResults]
}


import Foundation

struct MapResults: Codable {
    struct Coords: Codable {
        let lat: Double
        let lon: Double
    }
    struct Place: Codable {
        let coords: Coords
    }
    let short_title: String
    let title: String
    let categories: [String]
    let place: Place?
}

struct MapResponce: Codable {
    let results: [MapResults]
}


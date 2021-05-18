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
    let age_restriction: String?
    let price: String?
    let is_free: Bool
    let images: [Image]
    let site_url: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        short_title = try container.decode(String.self, forKey: .short_title)
        place = try container.decode(Place?.self, forKey: .place)
        description = try container.decode(String.self, forKey: .description)
        categories = try container.decode([String].self, forKey: .categories)
        
      //  let categories_dict = []
        
//        for categorie in categories{
//            
//        }
        
        do {
            age_restriction = try String(container.decode(Int.self, forKey: .age_restriction))
        } catch DecodingError.typeMismatch {
            age_restriction = try container.decode(String.self, forKey: .age_restriction)
        } catch DecodingError.valueNotFound{
            age_restriction = ""
        }
        
        price = try container.decode(String?.self, forKey: .price)
        is_free = try container.decode(Bool.self, forKey: .is_free)
        images = try container.decode([Image].self, forKey: .images)
        site_url = try container.decode(String?.self, forKey: .site_url)
    }
}

struct PosterResponce: Codable {
    let results: [PosterResults]
}


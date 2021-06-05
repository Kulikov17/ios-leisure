import Foundation

struct MapResults: Codable {
    struct Coords: Codable {
        let lat: Double
        let lon: Double
    }
    struct Place: Codable {
        let address: String?
        let coords: Coords
    }
    struct Image: Codable {
        let image: String?
    }
    
    struct Dates:Codable {
        let start_date: String?
        let start_time: String?
        let start: Int?
        let end_date: String?
        let end_time: String?
        let end: Int?
        let is_endless: Bool
        let is_startless: Bool
    }
    
    let id: Int
    let title: String
    let short_title: String
    let place: Place?
    let description: String
    var categories: [String]
    let age_restriction: String?
    let price: String?
    let is_free: Bool
    let images: [Image]
    let site_url: String?
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        short_title = try container.decode(String.self, forKey: .short_title)
        place = try container.decode(Place?.self, forKey: .place)
        description = try container.decode(String.self, forKey: .description)
        let categories_dict = ["business-events": "События для бизнеса", "cinema": " Кино", "concert": "Концерты", "education": "Обучение",
                               "entertainment": "Развлечения", "exhibition": "Выставки", "fashion": "Мода и стиль", "festival": "Фестивали",
                               "holiday": "Праздники", "kids": "Детям", "other": "Разное", "party": "Вечеринки", "photo": "Фотография", "quest": "Квесты",
                               "recreation": "Отдых", "shopping": "Шопинг", "social-activity": "Благотворительность", "theater": "Спектакли",
                               "tour": "Экскурсии", "yarmarki-razvlecheniya-yarmarki": "Ярмарки" ]
        
        let raw_categories = try container.decode([String].self, forKey: .categories)
        categories = []
        for categ in raw_categories{
            categories.append(categories_dict[categ] ?? "Разное")
        }
        
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

struct MapResponce: Codable {
    let results: [MapResults]
}

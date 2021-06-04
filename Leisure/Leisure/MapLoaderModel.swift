import Foundation

struct MapServiceLoader{
    private var places: MapServiceInfo
    
    private var urlString: String {
        var locations = places.location
        
        var urlString = "https://kudago.com/public-api/v1.3/events/?location=\(locations)"
        
        if places.category.count != 0 {
            urlString += "&categories="
            for cat in places.category{
                urlString += cat + ","
            }
        }
        if urlString.last == "," {
                    _ = urlString.popLast()
                }
        
        urlString += "&page_size=500&actual_since=\(NSDate().timeIntervalSince1970)&fields=id,title,short_title,place,description,categories,age_restriction,price,is_free,images,site_url&expand=place"
        
        return urlString;
    }
    
    init(places: MapServiceInfo){
        self.places = places
    }
    
    func mapInfoUrl() -> String {
        return urlString
    }
}
    

struct MapServiceInfo {
    var location: String
    var category: [String]
}

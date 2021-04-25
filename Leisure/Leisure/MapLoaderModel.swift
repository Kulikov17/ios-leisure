import Foundation

struct MapServiceLoader{
    private var places: [MapServiceInfo]
    
    private var urlString: String {
        var locations = places.reduce("",  { res, current in
            return res + current.location + ","
        })
        
        if locations.last == "," {
            _ = locations.popLast()
        }
        
        let urlString = "https://kudago.com/public-api/v1.3/events/?location=\(locations)&categories=party,concert&fields=title,short_title,place,categories,&expand=place"
        return urlString;
    }
    
    init(places: [MapServiceInfo]){
        self.places = places
    }
    
    func mapInfoUrl() -> String {
        return urlString
    }
}
    

struct MapServiceInfo {
    let location: String
}

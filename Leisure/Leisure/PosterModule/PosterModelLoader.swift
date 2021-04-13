import Foundation

struct PosterServiceLoader{
    private var posters: [PosterServiceInfo]
    
    private var urlString: String {
        var locations = posters.reduce("",  { res, current in
            return res + current.location + ","
        })
        
        if locations.last == "," {
            _ = locations.popLast()
        }
        
        let urlString = "https://kudago.com/public-api/v1.3/events/?location=\(locations)&fields=id,title,description,price"
        return urlString;
    }
    
    init(posters: [PosterServiceInfo]){
        self.posters = posters
    }
    
    func posterUrl() -> String {
        return urlString
    }
}
    

struct PosterServiceInfo {
    let location: String
  //  let category: String
}

import UIKit

struct Entertainment{
    let name: String
    let type: String
    let info: String
    let imagePath: String
    let cost: Int

    func getImage() -> UIImage? {
        return UIImage(named: imagePath)
    }

}

import MapKit

class MapPlace: NSObject, MKAnnotation {
  let title: String?
  let subtitle: String?
  let coordinate: CLLocationCoordinate2D
  let poster: PosterViewModel

  init(
    title: String?,
    subtitle: String?,
    coordinate: CLLocationCoordinate2D,
    poster: PosterViewModel
  ) {
    self.title = title
    self.subtitle = subtitle
    self.coordinate = coordinate
    self.poster = poster

    super.init()
  }
}

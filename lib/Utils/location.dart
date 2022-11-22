const googleApiKey = 'AIzaSyBRm-rFbb5WX4mM9f5PtbG5P30_HUlPKGU';

class LocationGoogle {
  static String generateLocationPreviewImage({
    double? latitude,
    double? longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=14&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%$latitude,$longitude&key=$googleApiKey';
  }
}

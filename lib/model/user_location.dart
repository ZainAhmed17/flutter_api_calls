class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinates coordinates;
  final LocationTimezoneCoordinates timezone;
  UserLocation(
      {required this.city,
      required this.state,
      required this.postcode,
      required this.country,
      required this.street,
      required this.coordinates,
      required this.timezone});
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({
    required this.number,
    required this.name,
  });
}

class LocationCoordinates {
  final String lattitude;
  final String longitude;
  LocationCoordinates({
    required this.lattitude,
    required this.longitude,
  });
}

class LocationTimezoneCoordinates {
  final String offset;
  final String desc;
  LocationTimezoneCoordinates({
    required this.offset,
    required this.desc,
  });
}

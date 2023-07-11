// ignore_for_file: non_constant_identifier_names

import 'package:api_calls/model/user_dob.dart';
import 'package:api_calls/model/user_location.dart';
import 'package:api_calls/model/user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String nat;
  final String cell;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required LocationCoordinates coordinates,
    required LocationStreet street,
    required LocationTimezoneCoordinates timezone,
  });

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName(
        first: e['name']['first'],
        last: e['name']['last'],
        title: e['name']['title']);
    final date = e['dob']['date'];

    final dob = UserDob(age: e['dob']['age'], date: DateTime.parse(date));

    final coordinates = LocationCoordinates(
        lattitude: e['location']['coordinates']['latitude'],
        longitude: e['location']['coordinates']['longitude']);

    final street = LocationStreet(
        number: e['location']['street']['number'],
        name: e['location']['street']['name']);

    final timezone = LocationTimezoneCoordinates(
        offset: e['location']['timezone']['offset'],
        desc: e['location']['timezone']['description']);

    final location = UserLocation(
      city: e['location']['city'],
      state: e['location']['state'],
      postcode: e['location']['postcode'].toString(),
      country: e['location']['country'],
      coordinates: coordinates,
      street: street,
      timezone: timezone,
    );
    return User(
      cell: e['cell'],
      email: e['email'],
      gender: e['gender'],
      nat: e['nat'],
      phone: e['phone'],
      name: name,
      dob: dob,
      location: location,
      coordinates: coordinates,
      street: street,
      timezone: timezone,
    );
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
